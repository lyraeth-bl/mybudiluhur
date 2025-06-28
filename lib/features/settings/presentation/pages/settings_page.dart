import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_container.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const MyLoadingScreen(
            text: "Loading your settings...",
            title: "Settings",
          );
        } else if (state is SettingsLoaded) {
          bool isDark = state.settingsUser.theme == "true";
          bool isNotif = state.settingsUser.notification == "true";

          return ListView(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
            children: [
              _buildSettingCard(
                context: context,
                icon: Icons.dark_mode,
                title: "Mode Gelap",
                subtitle: isDark ? "Tema gelap aktif" : "Tema terang aktif",
                value: isDark,
                onChanged: (_) {
                  context.read<SettingsCubit>().changeThemeMode();
                  themeCubit.toggleTheme();
                },
                iconColor: isDarkMode
                    ? Colors.indigo.shade200
                    : Colors.indigo.shade700,
              ),
              SizedBox(height: 12.h),
              _buildSettingCard(
                context: context,
                icon: Icons.notifications_active,
                title: "Notifikasi",
                subtitle: isNotif ? "Notifikasi aktif" : "Notifikasi nonaktif",
                value: isNotif,
                onChanged: (_) =>
                    context.read<SettingsCubit>().changeNotification(),
                iconColor: isDarkMode
                    ? Colors.orange.shade200
                    : Colors.orange.shade700,
              ),
              SizedBox(height: 32.h),
              Center(
                child: MyText(
                  text: "Stay awesome, Budi Luhur squad! 😎",
                  textSize: 15.r,
                  bold: true,
                  textColor: colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
            ],
          );
        } else if (state is SettingsError) {
          return Center(
            child: MyText(
              text: state.message,
              textColor: colorScheme.error,
              textSize: 16.r,
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(color: colorScheme.primary),
        );
      },
    );
  }

  Widget _buildSettingCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required void Function(bool) onChanged,
    required Color iconColor,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 450),
      tween: Tween<double>(begin: 0.97, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: MyContainer(
        color: colorScheme.surface,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: iconColor.withValues(alpha: 0.2),
            child: Icon(icon, color: iconColor, size: 24.r),
          ),
          title: MyText(
            text: title,
            textSize: 18.r,
            bold: true,
            textColor: colorScheme.onSurface,
          ),
          subtitle: MyText(
            text: subtitle,
            textSize: 14.r,
            textColor: colorScheme.tertiary,
          ),
          trailing: Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: colorScheme.primary,
            inactiveTrackColor: colorScheme.onInverseSurface,
            inactiveThumbColor: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        ),
      ),
    );
  }
}
