import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';

class DrawerPhotoProfile extends StatefulWidget {
  final HomeUser homeUser;
  const DrawerPhotoProfile({super.key, required this.homeUser});

  @override
  State<DrawerPhotoProfile> createState() => _DrawerPhotoProfileState();
}

class _DrawerPhotoProfileState extends State<DrawerPhotoProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
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
                        'https://laravelbackend.jh-beon.cloud/smk/public/${widget.homeUser.profileImageUrl}',
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
          MyText(text: widget.homeUser.nama, textSize: 16),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(15),
            ),
            child: MyText(text: widget.homeUser.nis, textColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
