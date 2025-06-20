import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/drawer/drawer_list_menu.dart';
import 'package:mybudiluhur/components/drawer/drawer_photo_profile.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final homeUser = context.read<HomeCubit>().currentHomeUser;
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Photo Profile
            DrawerPhotoProfile(nis: homeUser!.nis),
            MyDivider(padding: EdgeInsets.all(0)),
            Expanded(child: DrawerListMenu()),
          ],
        ),
      ),
    );
  }
}
