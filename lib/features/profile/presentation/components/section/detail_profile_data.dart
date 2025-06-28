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
                // * Title
                MyText(
                  text: widget.detailProfileUser.toMap().keys.elementAt(index),
                  bold: true,
                  textSize: 20.r,
                ),
                SizedBox(height: 10.h),
              ],
            ),

            // * Value Textfield
            subtitle: MyCard(
              padding: const EdgeInsets.symmetric(horizontal: 5).r,
              color: Theme.of(context).colorScheme.surface,
              borderColor: Theme.of(context).colorScheme.onInverseSurface,
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
                textOverflow: TextOverflow.visible,
                maxLines: null,
                textSize: 14.r,
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
