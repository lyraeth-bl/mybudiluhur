import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_cubit.dart';

class DrawerPhotoProfile extends StatefulWidget {
  final String nis;
  const DrawerPhotoProfile({super.key, required this.nis});

  @override
  State<DrawerPhotoProfile> createState() => _DrawerPhotoProfileState();
}

class _DrawerPhotoProfileState extends State<DrawerPhotoProfile> {
  // Cubit
  late final homeCubit = context.read<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    final homeUserData = homeCubit.currentHomeUser;
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
                        'https://laravelbackend.jh-beon.cloud/smk/public/${homeUserData!.profileImageUrl}',
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
          Text(homeUserData.nama, style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              homeUserData.nis,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
