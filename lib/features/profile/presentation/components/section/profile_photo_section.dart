import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_page_transition.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/pages/section/change_password_page.dart';
import 'package:mybudiluhur/features/profile/presentation/pages/section/change_picture_page.dart';

class ProfilePhotoSection extends StatelessWidget {
  const ProfilePhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profileUserData = context.read<ProfileCubit>().currentProfileUser;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[700],
          ),
          height: 120,
          width: 120,
          child: Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://laravelbackend.jh-beon.cloud/smk/public/${profileUserData!.profileImageUrl}',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 56, color: Colors.red),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyPageTransition.left(
                destination: SizedBox(),
                child: MyContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
                  color: Colors.lightBlue[400],
                  child: MyText(
                    text: "Detail Profile",
                    textColor: Colors.white,
                    bold: true,
                    textSize: 15,
                  ),
                ),
              ),
              MyPageTransition.left(
                destination: ChangePicturePage(profileUser: profileUserData),
                child: MyContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
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
        ),
      ],
    );
  }
}
