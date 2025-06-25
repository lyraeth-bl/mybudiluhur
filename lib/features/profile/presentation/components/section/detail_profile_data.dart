import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_card.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/domain/entities/detail_profile_user.dart';

class DetailProfileData extends StatefulWidget {
  final DetailProfileUser detailProfileUser;
  const DetailProfileData({super.key, required this.detailProfileUser});

  @override
  State<DetailProfileData> createState() => _DetailProfileDataState();
}

class _DetailProfileDataState extends State<DetailProfileData> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return SafeArea(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                MyText(
                  text: widget.detailProfileUser.toMap().keys.elementAt(index),
                  bold: true,
                  textSize: 18.sp,
                ),
                SizedBox(height: 10.h),
              ],
            ),
            subtitle: MyCard(
              padding: EdgeInsetsGeometry.zero,
              color: Theme.of(context).colorScheme.surface,
              borderColor: Colors.grey[300],
              child: MyText(
                text:
                    widget.detailProfileUser
                        .toMap()
                        .values
                        .elementAt(index)
                        ?.toString() ??
                    '-',
                bold: true,
                textColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const MyDivider(),
      itemCount: widget.detailProfileUser.toMap().length,
    );
  }
}
