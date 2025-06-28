import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final void Function()? onTap;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.suffixIcon,
    this.suffixIconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12).r,
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black87 : Colors.black12,
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode
                  ? Theme.of(context).colorScheme.onInverseSurface
                  : Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(12).r,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12).r,
          ),
          fillColor: isDarkMode
              ? Theme.of(context).colorScheme.onInverseSurface
              : Colors.white,
          filled: true,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    suffixIcon,
                    color:
                        suffixIconColor ??
                        Theme.of(context).colorScheme.primary,
                  ),
                )
              : null,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14.sp,
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
        ),
      ),
    );
  }
}
