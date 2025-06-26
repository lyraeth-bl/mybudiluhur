import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/components/my_text.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const LoginButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12).r,
          ),
          padding: EdgeInsets.symmetric(vertical: 10).r,
          elevation: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(text: "Login", textSize: 16.sp, textColor: Colors.white),
            SizedBox(width: 10.w),
            Icon(LucideIcons.logIn, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
