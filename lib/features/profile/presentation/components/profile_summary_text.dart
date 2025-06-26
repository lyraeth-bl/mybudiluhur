import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_text.dart';

class ProfileSummaryText extends StatelessWidget {
  final String title;
  final String body;
  const ProfileSummaryText({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text: title,
            textColor: Theme.of(context).colorScheme.tertiary,
            textSize: 14.sp,
          ),
          MyText(
            text: body,
            bold: true,
            textColor: Theme.of(context).colorScheme.onSurface,
            textSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
