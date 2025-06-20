import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';

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
        MyText(text: profileUserData.nama, bold: true, textSize: 25),
        const SizedBox(height: 5),
        MyText(
          text: profileUserData.email,
          textSize: 20,
          textColor: Colors.grey[700],
        ),
        const SizedBox(height: 5),
        MyText(
          text: profileUserData.kelasSaatIni,
          textSize: 20,
          textColor: Colors.grey[700],
        ),
      ],
    );
  }
}
