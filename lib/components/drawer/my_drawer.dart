import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/components/drawer/drawer_list_menu.dart';
import 'package:mybudiluhur/components/drawer/drawer_photo_profile.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/absensi_khs/presentation/cubit/absensi_cubit.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/cubit/ekstrakulikuler_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_state.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/settings/presentation/cubits/cubit/settings_cubit.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // Cubit
  late final homeCubit = context.read<HomeCubit>();

  // ketika page dibuka fetch data
  @override
  void initState() {
    super.initState();
    homeCubit.fetchData();
  }

  void logout() {
    context.read<HomeCubit>().clear();
    context.read<ProfileCubit>().clear();
    context.read<EkstrakulikulerCubit>().clear();
    context.read<SettingsCubit>().clear();
    context.read<AbsensiCubit>().clear();
    context.read<AuthCubit>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          final user = state.homeUser;
          return Drawer(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Photo Profile
                  DrawerPhotoProfile(homeUser: user),
                  MyDivider(padding: EdgeInsets.zero),
                  Expanded(child: DrawerListMenu()),
                  Spacer(),
                  ListTile(
                    leading: Icon(
                      LucideIcons.logOut,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    title: MyText(
                      text: "Logout",
                      textColor: Theme.of(context).colorScheme.error,
                      bold: true,
                    ),
                    onTap: logout,
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
