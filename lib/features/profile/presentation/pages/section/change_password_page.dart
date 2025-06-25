import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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
    final nis = widget.profileUser.nis;

    await passwordCheckCubit.checkPassword(
      nis: nis,
      password: oldPasswordController.text,
    );
  }

  // Refresh state
  @override
  void initState() {
    super.initState();
    passwordCheckCubit.reset();
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
            title: MyText(text: "Change Password", bold: true),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
            child: Container(
              padding: const EdgeInsets.all(5).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          controller: oldPasswordController,
                          labelText: "Old Password",
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0).r,
                        child: GestureDetector(
                          onTap: checkPassword,
                          child: MyContainer(
                            color: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.all(10).r,
                            child: Icon(
                              LucideIcons.check,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  isPasswordVerified
                      ? MyTextField(
                          controller: newPasswordController,
                          labelText: "New Password",
                          obscureText: true,
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: changePassword,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            child: FaIcon(FontAwesomeIcons.floppyDisk),
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
