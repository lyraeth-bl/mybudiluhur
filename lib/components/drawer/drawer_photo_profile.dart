import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25).r,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            height: 120.h,
            width: 120.w,
            child: Center(
              child: CircleAvatar(
                radius: 55.r,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://laravelbackend.jh-beon.cloud/smk/public/${widget.homeUser.profileImageUrl}',
                    width: 120.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: 56,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          MyText(
            text: widget.homeUser.nama,
            textSize: 16.sp,
            bold: true,
            textColor: Theme.of(context).colorScheme.tertiary,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5).w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15).r,
            ),
            child: MyText(
              text: 'NIS : ${widget.homeUser.nis}',
              textColor: Theme.of(context).colorScheme.onPrimary,
              textSize: 14.sp,
              bold: true,
            ),
          ),
        ],
      ),
    );
  }
}
