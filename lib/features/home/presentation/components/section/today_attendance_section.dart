import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/components/my_card.dart';
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MyCard(
      color: Theme.of(context).colorScheme.surface,
      borderColor: Theme.of(context).colorScheme.onInverseSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Judul dan Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyContainer(
                color: Theme.of(context).colorScheme.secondary,
                child: MyText(
                  text: "Today's Attendance!",
                  textSize: 18.r,
                  bold: true,
                  textColor: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              MyPageTransition.left(
                destination: SizedBox(),
                child: Icon(
                  Icons.arrow_circle_right,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30.r,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // * Tanggal
          MyText(
            text: '$days, $date',
            textColor: Theme.of(context).colorScheme.onSurface,
            textSize: 14.r,
          ),
          SizedBox(height: 10.h),

          // * Checkin & Checkout
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CheckInOutBox(
                color: Theme.of(context).colorScheme.surface,
                icon: LucideIcons.logIn,
                text: "Checkin Time",
                time: "07:00",
                borderColor: Theme.of(context).colorScheme.onInverseSurface,
                iconColor: isDarkMode
                    ? Colors.lightGreenAccent[400]
                    : Colors.green[700],
                timeColor: isDarkMode
                    ? Colors.lightGreenAccent[400]
                    : Colors.green[700],
              ),
              CheckInOutBox(
                color: Theme.of(context).colorScheme.surface,
                icon: LucideIcons.logOut,
                text: "Checkout Time",
                time: "15:30",
                borderColor: Theme.of(context).colorScheme.onInverseSurface,
                iconColor: isDarkMode ? Colors.redAccent[200] : Colors.red[700],
                timeColor: isDarkMode ? Colors.redAccent[200] : Colors.red[700],
              ),
            ],
          ),

          SizedBox(height: 20.h),
          MyText(
            text: "What a great day, See You Tomorrow!",
            bold: true,
            textSize: 12.r,
            textColor: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}

class CheckInOutBox extends StatelessWidget {
  final Color? color;
  final Color borderColor;
  final String text;
  final String time;
  final IconData? icon;
  final Color? iconColor;
  final Color? timeColor;

  const CheckInOutBox({
    super.key,
    this.icon,
    required this.text,
    required this.time,
    this.color,
    required this.borderColor,
    this.iconColor,
    this.timeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(15).r,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: iconColor?.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10).r,
            ),
            child: Icon(icon, size: 20.r, color: iconColor),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: text,
                textColor: Theme.of(context).colorScheme.tertiary,
                bold: true,
                textSize: 12.r,
              ),
              SizedBox(height: 5.h),
              MyText(
                text: time,
                textColor: timeColor ?? Theme.of(context).colorScheme.tertiary,
                textSize: 14.r,
                bold: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
