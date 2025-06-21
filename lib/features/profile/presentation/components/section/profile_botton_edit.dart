import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_page_transition.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';
import 'package:mybudiluhur/features/profile/presentation/pages/section/change_password_page.dart';
import 'package:mybudiluhur/features/profile/presentation/pages/section/change_picture_page.dart';

class ProfileBottonEdit extends StatefulWidget {
  final ProfileUser profileUser;
  const ProfileBottonEdit({super.key, required this.profileUser});

  @override
  State<ProfileBottonEdit> createState() => _ProfileBottonEditState();
}

class _ProfileBottonEditState extends State<ProfileBottonEdit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyPageTransition.left(
            destination: ChangePicturePage(profileUser: widget.profileUser),
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
            destination: ChangePasswordPage(profileUser: widget.profileUser),
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
