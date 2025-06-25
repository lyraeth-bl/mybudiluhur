import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/settings/presentation/cubits/cubit/settings_cubit.dart';
import 'package:mybudiluhur/features/settings/presentation/cubits/cubit/settings_state.dart';
import 'package:mybudiluhur/theme/cubit/theme_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Cubit
  late final settingsCubit = context.read<SettingsCubit>();
  late final authCubit = context.read<AuthCubit>().currentUser;

  @override
  void initState() {
    super.initState();
    settingsCubit.fetchSettings(authCubit!.nis);
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const MyLoadingScreen(
            text: "Loading your settings...",
            title: "Settings",
          );
        } else if (state is SettingsLoaded) {
          // Convert string to bool safely
          bool isDark = state.settingsUser.theme == "true";
          bool isNotif = state.settingsUser.notification == "true";

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            children: [
              _buildAnimatedCard(
                icon: Icons.dark_mode,
                title: "Mode Gelap",
                subtitle: isDark ? "Tema gelap aktif" : "Tema terang aktif",
                value: isDark,
                onChanged: (_) {
                  context.read<SettingsCubit>().changeThemeMode();
                  themeCubit.toggleTheme();
                },
                color: Colors.indigoAccent,
              ),
              const SizedBox(height: 18),
              _buildAnimatedCard(
                icon: Icons.notifications_active,
                title: "Notifikasi",
                subtitle: isNotif ? "Notifikasi aktif" : "Notifikasi nonaktif",
                value: isNotif,
                onChanged: (_) =>
                    context.read<SettingsCubit>().changeNotification(),
                color: Colors.orangeAccent,
              ),
              const SizedBox(height: 32),
              Center(
                child: MyText(
                  text: "Stay awesome, Budi Luhur squad! 😎",
                  textSize: 15,
                  bold: true,
                ),
              ),
            ],
          );
        } else if (state is SettingsError) {
          return Center(
            child: MyText(text: state.message, textColor: Colors.red),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildAnimatedCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required void Function(bool) onChanged,
    required Color color,
  }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 450),
      tween: Tween<double>(begin: 0.97, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: Card(
        elevation: 7,
        color: color.withValues(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          title: MyText(text: title, textSize: 18, bold: true),

          subtitle: MyText(text: subtitle, textSize: 14),
          trailing: Switch.adaptive(
            value: value,
            onChanged: onChanged,
            inactiveThumbColor: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
