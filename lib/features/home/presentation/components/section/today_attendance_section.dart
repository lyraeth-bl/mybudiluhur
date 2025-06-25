import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_page_transition.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/date_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/section/days_cubit.dart';

class TodayAttendanceSection extends StatelessWidget {
  const TodayAttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final days = context.read<DaysCubit>().state;
    final date = context.read<DateCubit>().state;
    // Padding Luar
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,

      // Background Abu-Abu
      child: Container(
        padding: const EdgeInsets.all(10).r,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0.0, 1.0),
              blurRadius: 5,
            ),
          ],
          color: Theme.of(context).colorScheme.surface,
          border: BoxBorder.all(color: Theme.of(context).colorScheme.surface),
          borderRadius: BorderRadius.circular(15).r,
        ),

        // Isi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul dan Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyContainer(
                  color: Theme.of(context).colorScheme.secondary,
                  child: MyText(
                    text: "Today's Attendance!",
                    textSize: 14.sp,
                    bold: true,
                    textColor: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                MyPageTransition.left(
                  destination: SizedBox(),
                  child: Icon(
                    Icons.arrow_circle_right,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            MyText(
              text: '$days, $date',
              textColor: Theme.of(context).colorScheme.onSurface,
            ),
            SizedBox(height: 10.h),

            // Checkin & Checkout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckInOutBox(
                  color: Colors.green[50],
                  icon: LucideIcons.logIn,
                  text: "Checkin Time...",
                  time: "07:00",
                  borderColor: Color(0xFFE3F2FD),
                ),
                CheckInOutBox(
                  color: Colors.red[50],
                  icon: LucideIcons.logOut,
                  text: "Checkout Time...",
                  time: "15:30",
                  borderColor: Color(0xFFE3F2FD),
                ),
              ],
            ),

            SizedBox(height: 20.h),
            MyText(
              text: "What a great day, See You Tomorrow!",
              bold: true,
              textSize: 12.sp,
              textColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}

// Box Checkin & Checkout
class CheckInOutBox extends StatelessWidget {
  final Color? color;
  final Color borderColor;
  final String text;
  final String time;
  final IconData? icon;
  const CheckInOutBox({
    super.key,
    this.icon,
    required this.text,
    required this.time,
    this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      padding: const EdgeInsets.all(10).r,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: borderColor),
        borderRadius: BorderRadius.circular(15).r,
        color: color,
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: text,
                textColor: Theme.of(context).colorScheme.tertiary,
                bold: true,
                textSize: 12.sp,
              ),
              SizedBox(height: 5.h),
              MyText(
                text: time,
                textColor: Theme.of(context).colorScheme.tertiary,
                textSize: 14.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
