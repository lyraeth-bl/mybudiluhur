import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final void Function()? onTap;

  const MyTextField({
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.r,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          // Border ketika tidak dipilih
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(12).r,
          ),

          // Border ketika dipilih
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF81D4FA)),
            borderRadius: BorderRadius.circular(12).r,
          ),
          fillColor: Colors.white70,
          filled: true,
          suffixIcon: GestureDetector(onTap: onTap, child: Icon(suffixIcon)),
          suffixIconColor: suffixIconColor,
          labelStyle: TextStyle(color: Colors.black, fontSize: 14.r),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
