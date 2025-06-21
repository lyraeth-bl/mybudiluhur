import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        const SnackBar(content: Text("Masukkan NIS dan Password!")),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    nisController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo BL
              Image.asset("assets/image/bl_logo.png", width: 200, height: 200),
              const SizedBox(height: 20),

              const SizedBox(height: 10),
              MyText(text: "Selamat datang di MyBudiLuhur", textSize: 20),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    // NIS Text Field
                    LoginTextField(
                      controller: nisController,
                      hintText: "NIS",
                      obscureText: false,
                      suffixIcon: Icons.person_outline,
                      suffixIconColor: Theme.of(context).colorScheme.primary,
                    ),

                    const SizedBox(height: 5),

                    // Password Text Field
                    LoginTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                      suffixIcon: Icons.password,
                      suffixIconColor: Colors.green[600],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Forget Password?",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 30),
                            LoginButton(onPressed: _handleLogin, text: "Login"),
                          ],
                        ),
                      ],
                    ),
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
