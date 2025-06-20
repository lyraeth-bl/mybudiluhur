import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_page_transition.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/pages/section/change_password_page.dart';
import 'package:mybudiluhur/features/profile/presentation/pages/section/change_picture_page.dart';

class ProfileBottonEdit extends StatelessWidget {
  const ProfileBottonEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final profileUserData = context.read<ProfileCubit>().currentProfileUser!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyPageTransition.left(
            destination: ChangePicturePage(profileUser: profileUserData),
            child: MyContainer(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              color: Colors.lightBlue[400],
              child: MyText(
                text: "Change Picture",
                textColor: Colors.white,
                bold: true,
                textSize: 15,
              ),
            ),
          ),
          MyPageTransition.left(
            destination: ChangePasswordPage(profileUser: profileUserData),
            child: MyContainer(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              color: Colors.lightBlue[400],
              child: MyText(
                text: "Change Password",
                textColor: Colors.white,
                bold: true,
                textSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
