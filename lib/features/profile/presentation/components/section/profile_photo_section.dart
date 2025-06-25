import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            color: Theme.of(context).colorScheme.primary,
          ),
          height: 100.h,
          width: 120.w,
          child: Center(
            child: CircleAvatar(
              radius: 55.r,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://laravelbackend.jh-beon.cloud/smk/public/${widget.profileUser.profileImageUrl}',
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
        SizedBox(height: 20.h),
        MyText(
          text: widget.profileUser.nama,
          bold: true,
          textSize: 18.sp,
          textColor: Theme.of(context).colorScheme.onSurface,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.h),
        MyText(
          text: widget.profileUser.email,
          textSize: 16.sp,
          textColor: Theme.of(context).colorScheme.tertiary,
        ),
        SizedBox(height: 5.h),
        MyText(
          text: widget.profileUser.kelasSaatIni,
          textSize: 16.sp,
          textColor: Theme.of(context).colorScheme.tertiary,
        ),
      ],
    );
  }
}
