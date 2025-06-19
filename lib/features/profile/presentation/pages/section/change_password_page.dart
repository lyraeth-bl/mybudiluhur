import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/components/my_text_field.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_state.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/password_check_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/password_check_state.dart';

class ChangePasswordPage extends StatefulWidget {
  final ProfileUser profileUser;
  const ChangePasswordPage({super.key, required this.profileUser});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  // Controller
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  // Cubit
  late final profileCubit = context.read<ProfileCubit>();
  late final passwordCheckCubit = context.read<PasswordCheckCubit>();

  // Logic Save Button
  void changePassword() async {
    final nis = widget.profileUser.nis;

    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return MyCupertinoAlertDialog(
            text:
                'You should check your old password and fill new password first!',
          );
        },
      );
      return;
    }

    await profileCubit.updateProfile(
      nis: nis,
      newPassword: newPasswordController.text.isNotEmpty
          ? newPasswordController.text
          : null,
    );

    passwordCheckCubit.reset();

    if (!mounted) return;

    Navigator.of(context).pop();
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return MyCupertinoAlertDialog(text: "Password successfully change");
      },
    );
  }

  // Logic Check Password
  void checkPassword() async {
    await passwordCheckCubit.checkPassword(
      password: oldPasswordController.text,
    );
  }

  // Refresh state
  @override
  void initState() {
    super.initState();
    context.read<PasswordCheckCubit>().reset();
  }

  // Dispose semua Text
  @override
  void dispose() {
    super.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordCheckCubit, PasswordCheckState>(
      builder: (context, passwordState) {
        // Loading ketika Save
        final profileState = context.watch<ProfileCubit>().state;
        if (profileState is ProfileLoading) {
          return MyLoadingScreen(text: "Saving your new password...");
        }

        // Change password page
        final isPasswordVerified = passwordState is PasswordCheckSuccess;
        return Scaffold(
          appBar: AppBar(
            title: Text("Change Password"),
            centerTitle: true,
            backgroundColor: Colors.lightBlue[400],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  MyText(text: "Old Password", bold: true),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          controller: oldPasswordController,
                          hintText: "Old Password",
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: checkPassword,
                          child: MyContainer(
                            color: Colors.lightBlue[400],
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.check_box,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  isPasswordVerified
                      ? MyText(text: "New Password", bold: true)
                      : SizedBox.shrink(),
                  SizedBox(height: 10),
                  isPasswordVerified
                      ? MyTextField(
                          controller: newPasswordController,
                          hintText: "New Password",
                          obscureText: true,
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 20),
                  isPasswordVerified
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: changePassword,
                              child: MyContainer(
                                color: Colors.lightBlue[400],
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: MyText(
                                  text: "Save",
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        // Alert kalo password sama
        if (state is PasswordCheckSuccess) {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return MyCupertinoAlertDialog(text: "Password Match!");
            },
          );
        }
        // Alert kalo password beda
        if (state is PasswordCheckError) {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return MyCupertinoAlertDialog(text: "Password not match!");
            },
          );
        }
      },
    );
  }
}
