import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_text.dart';

class MyNullDataPage extends StatelessWidget {
  final String? message;

  const MyNullDataPage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox,
            size: 72.r,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          SizedBox(height: 20.h),
          MyText(
            text: message ?? "Data tidak ditemukan",
            textColor: Theme.of(context).colorScheme.tertiary,
            textAlign: TextAlign.center,
            textSize: 18.r,
          ),
        ],
      ),
    );
  }
}
