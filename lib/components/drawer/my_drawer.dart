import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/drawer/drawer_photo_profile.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Photo Profile
            DrawerPhotoProfile(),
            MyDivider(),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().logout();
              },
              child: MyText(text: "Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
