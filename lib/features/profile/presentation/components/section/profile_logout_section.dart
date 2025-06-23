import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/cubit/ekstrakulikuler_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/settings/presentation/cubits/cubit/settings_cubit.dart';

class ProfileLogoutSection extends StatefulWidget {
  const ProfileLogoutSection({super.key});

  @override
  State<ProfileLogoutSection> createState() => _ProfileLogoutSectionState();
}

class _ProfileLogoutSectionState extends State<ProfileLogoutSection> {
  void logout() {
    context.read<HomeCubit>().clear();
    context.read<ProfileCubit>().clear();
    context.read<EkstrakulikulerCubit>().clear();
    context.read<SettingsCubit>().clear();
    context.read<AuthCubit>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyContainer(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.red,
            child: GestureDetector(
              onTap: logout,
              child: MyText(text: "Logout", textColor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
