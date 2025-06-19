import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_page_transition.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/date_cubit.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/days_cubit.dart';

class TodayAttendanceSection extends StatelessWidget {
  const TodayAttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final days = context.read<DaysCubit>().state;
    final date = context.read<DateCubit>().state;
    // Padding Luar
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      // Background Abu-Abu
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0.0, 1.0),
              blurRadius: 5,
            ),
          ],
          color: Colors.grey[100],
          border: BoxBorder.all(color: Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.circular(15),
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
                  color: Colors.amber[300],
                  child: MyText(
                    text: "Today's Attendance!",
                    textSize: 16,
                    bold: true,
                    textColor: Colors.black,
                  ),
                ),
                MyPageTransition.left(
                  destination: SizedBox(),
                  child: Icon(
                    Icons.arrow_circle_right,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            MyText(text: '$days, $date'),
            SizedBox(height: 10),

            // Checkin & Checkout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckInOutBox(
                  color: Colors.green[50],
                  text: "Checkin Time...",
                  time: "07:00",
                  borderColor: Color(0xFFE3F2FD),
                ),
                CheckInOutBox(
                  color: Colors.red[50],
                  text: "Checkout Time...",
                  time: "15:30",
                  borderColor: Color(0xFFE3F2FD),
                ),
              ],
            ),
            SizedBox(height: 20),
            MyText(
              text: "What a great day, See You Tomorrow!",
              bold: true,
              textColor: Colors.grey[700],
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
  const CheckInOutBox({
    super.key,
    required this.text,
    required this.time,
    this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Row(
        children: [
          Icon(Icons.logout),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(text: text),
              MyText(text: time),
            ],
          ),
        ],
      ),
    );
  }
}
