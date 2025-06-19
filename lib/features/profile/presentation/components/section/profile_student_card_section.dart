import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileStudentCardSection extends StatelessWidget {
  const ProfileStudentCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<ProfileCubit>().currentProfileUser;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
          gradient: LinearGradient(
            colors: [Color(0xFFFBC02D), Color(0xFFFFF176)],
          ),
          border: BoxBorder.all(color: Colors.amber),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/image/bl_logo.png',
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MyText(text: "Student Card", textSize: 25, bold: true),
                    SizedBox(height: 10),
                    MyText(text: user!.nama, textSize: 15),
                    SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white70,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'NIS: ${user.nis}',
                            textColor: Colors.black,
                            bold: true,
                          ),
                          MyText(text: " | "),
                          MyText(text: 'NISN: ${user.nisn}', bold: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
