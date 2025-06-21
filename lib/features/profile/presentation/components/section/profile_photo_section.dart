import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';

class ProfilePhotoSection extends StatefulWidget {
  final ProfileUser profileUser;
  const ProfilePhotoSection({super.key, required this.profileUser});

  @override
  State<ProfilePhotoSection> createState() => _ProfilePhotoSectionState();
}

class _ProfilePhotoSectionState extends State<ProfilePhotoSection> {
  @override
  Widget build(BuildContext context) {
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
                      'https://laravelbackend.jh-beon.cloud/smk/public/${widget.profileUser.profileImageUrl}',
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
        MyText(text: widget.profileUser.nama, bold: true, textSize: 25),
        const SizedBox(height: 5),
        MyText(
          text: widget.profileUser.email,
          textSize: 20,
          textColor: Colors.grey[700],
        ),
        const SizedBox(height: 5),
        MyText(
          text: widget.profileUser.kelasSaatIni,
          textSize: 20,
          textColor: Colors.grey[700],
        ),
      ],
    );
  }
}
