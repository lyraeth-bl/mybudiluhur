import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_text.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const LoginButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(text: "Login", textSize: 16.r, textColor: Colors.white),
            SizedBox(width: 10.w),
            Icon(LucideIcons.logIn, color: Colors.white, size: 20.r),
          ],
        ),
      ),
    );
  }
}
