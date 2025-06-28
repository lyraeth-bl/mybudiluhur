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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black.withOpacity(0.7)
                  : Colors.black45,
              offset: const Offset(0.0, 1.0),
              blurRadius: 5,
            ),
          ],
          gradient: LinearGradient(
            colors: isDarkMode
                ? [
                    Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  ]
                : [
                    Color(0xFFFBC02D),
                    Color(0xFFFFF176),
                  ], // Tetap kuning untuk light mode
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5,
          ),
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
                        textColor: isDarkMode
                            ? Colors
                                  .black // Tetap hitam di dark mode karena background kuning
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                      SizedBox(height: 10.h),

                      // * Nama
                      MyText(
                        text: widget.profileUser.nama,
                        textSize: 14.r,
                        textColor: isDarkMode
                            ? Colors
                                  .black // Tetap hitam di dark mode karena background kuning
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                      SizedBox(height: 15.h),

                      // * NIS dan NISN
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          borderRadius: BorderRadius.circular(12).r,
                          color: isDarkMode
                              ? Colors.black.withOpacity(0.3)
                              : Theme.of(context).colorScheme.surface,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'NIS: ${widget.profileUser.nis}',
                              textColor: isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.onSurface,
                              bold: true,
                              textSize: 12.r,
                            ),
                            MyText(
                              text: " | ",
                              textColor: isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.onSurface,
                              textSize: 12.r,
                            ),
                            MyText(
                              text: 'NISN: ${widget.profileUser.nisn}',
                              bold: true,
                              textSize: 12.r,
                              textColor: isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.onSurface,
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
