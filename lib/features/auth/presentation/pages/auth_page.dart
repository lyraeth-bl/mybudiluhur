import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/auth/presentation/components/login_button.dart';
import 'package:mybudiluhur/features/auth/presentation/components/login_text_field.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // NIS & Password Controller
  final nisController = TextEditingController();
  final passwordController = TextEditingController();

  // Logic Login
  void _handleLogin() {
    // ambil NIS dan Password yang di input
    final String nisInput = nisController.text;
    final String passwordInput = passwordController.text;

    // Auth Cubit
    final authCubit = context.read<AuthCubit>();

    // check apakah field nis dan password kosong
    if (nisInput.isNotEmpty && passwordInput.isNotEmpty) {
      // Login
      authCubit.login(nisInput, passwordInput);
    }
    // kasih error kalo ada field yang kosong
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Masukkan NIS dan Password!"),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.down,
          margin: EdgeInsets.only(right: 25, left: 25, bottom: 20),
          showCloseIcon: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    nisController.dispose();
    passwordController.dispose();
  }

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // * Logo BL
              Image.asset(
                "assets/image/bl_logo.png",
                width: 150.r,
                height: 150.r,
              ),
              SizedBox(height: 20.h),

              // * Welcome text
              MyText(
                text: "Selamat datang di MyBudiLuhur",
                textSize: 22.r,
                textColor: Theme.of(context).colorScheme.primary,
                bold: true,
              ),
              SizedBox(height: 20.h),

              // * Textfield
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30).r,
                child: Column(
                  children: [
                    // * NIS Text Field
                    LoginTextField(
                      controller: nisController,
                      labelText: "NIS",
                      obscureText: false,
                      suffixIcon: LucideIcons.user,
                      suffixIconColor: Colors.lightBlue[400],
                    ),

                    SizedBox(height: 10.h),

                    // * Password Text Field
                    LoginTextField(
                      controller: passwordController,
                      labelText: "Password",
                      obscureText: isVisible ? true : false,
                      suffixIcon: isVisible
                          ? LucideIcons.eye
                          : LucideIcons.eyeClosed,
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      suffixIconColor: Colors.green[400],
                    ),

                    SizedBox(height: 10.h),

                    // * Forget Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            MyText(
                              text: "Forget Password?",
                              textSize: 12.r,
                              textColor: Theme.of(
                                context,
                              ).colorScheme.onSurface,
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ],
                    ),
                    LoginButton(onTap: _handleLogin, text: "Login"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
