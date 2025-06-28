import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';

class ProfileStudentCardSection extends StatefulWidget {
  final ProfileUser profileUser;
  const ProfileStudentCardSection({super.key, required this.profileUser});

  @override
  State<ProfileStudentCardSection> createState() =>
      _ProfileStudentCardSectionState();
}

class _ProfileStudentCardSectionState extends State<ProfileStudentCardSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10).r,
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
          border: BoxBorder.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(15).r,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // * BL Logo
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 55.r,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/image/bl_logo.png',
                        width: 75.r,
                        height: 75.r,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Title : Student Card
                      MyText(
                        text: "Student Card",
                        textSize: 25.r,
                        bold: true,
                        textColor: Theme.of(context).colorScheme.onSecondary,
                      ),
                      SizedBox(height: 10.h),

                      // * Nama
                      MyText(
                        text: widget.profileUser.nama,
                        textSize: 14.r,
                        textColor: Theme.of(context).colorScheme.onSecondary,
                      ),
                      SizedBox(height: 15.h),

                      // * NIS dan NISN
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ).r,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          borderRadius: BorderRadius.circular(12).r,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'NIS: ${widget.profileUser.nis}',
                              textColor: Theme.of(
                                context,
                              ).colorScheme.onSurface,
                              bold: true,
                              textSize: 12.r,
                            ),
                            MyText(
                              text: " | ",
                              textColor: Theme.of(
                                context,
                              ).colorScheme.onSurface,
                              textSize: 12.r,
                            ),
                            MyText(
                              text: 'NISN: ${widget.profileUser.nisn}',
                              bold: true,
                              textSize: 12.r,
                              textColor: Theme.of(
                                context,
                              ).colorScheme.onSurface,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
