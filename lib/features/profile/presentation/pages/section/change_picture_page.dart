import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_state.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/profile_picture_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/profile_picture_state.dart';

class ChangePicturePage extends StatefulWidget {
  final ProfileUser profileUser;
  const ChangePicturePage({super.key, required this.profileUser});

  @override
  State<ChangePicturePage> createState() => _ChangePicturePageState();
}

class _ChangePicturePageState extends State<ChangePicturePage> {
  // Cubit
  late final profileCubit = context.read<ProfileCubit>();
  late final profilePictureCubit = context.read<ProfilePictureCubit>();

  // Logic Save Button
  void updateProfile() async {
    final nis = widget.profileUser.nis;
    if (_selectedImageFile == null) {
      return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return MyCupertinoAlertDialog(text: "Pick an Image first to save");
        },
      );
    }
    await profileCubit.updateProfile(nis: nis);

    if (!mounted) return;

    Navigator.of(context).pop();
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return MyCupertinoAlertDialog(
          text:
              "Profile image successfully change, please refresh to take effect",
        );
      },
    );
  }

  // logic upload profile picture
  File? _selectedImageFile;

  // Logic pilih gambar
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        _selectedImageFile = file;
      });

      if (!mounted) return;

      context.read<ProfileCubit>().setSelectedImage(file);
      context.read<ProfilePictureCubit>().setSelectedImage();
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfilePictureCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePictureCubit, ProfilePictureState>(
      builder: (context, profilePictureState) {
        final profileState = context.watch<ProfileCubit>().state;
        if (profileState is ProfileLoading) {
          return MyLoadingScreen(text: "Saving your profile picture...");
        }

        final isPickedFile = profilePictureState is ProfilePictureSuccess;
        return Scaffold(
          appBar: AppBar(
            title: MyText(
              text: "Edit Profile Picture",
              bold: true,
              textSize: 20.r,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // * Last Profile Picture
                    CircleAvatar(
                      radius: 55.r,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundImage:
                              widget.profileUser.profileImageUrl.isNotEmpty
                              ? NetworkImage(
                                  'https://laravelbackend.jh-beon.cloud/smk/public/${widget.profileUser.profileImageUrl}',
                                )
                              : AssetImage('assets/images/default_avatar.png')
                                    as ImageProvider,
                        ),
                      ),
                    ),

                    // * Picked New Profile Picture
                    GestureDetector(
                      onTap: pickImage,
                      child: CircleAvatar(
                        radius: 55.r,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: ClipOval(
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage: _selectedImageFile != null
                                ? FileImage(_selectedImageFile!)
                                : (widget.profileUser.profileImageUrl.isNotEmpty
                                          ? NetworkImage(
                                              'https://laravelbackend.jh-beon.cloud/smk/public/${widget.profileUser.profileImageUrl}',
                                            )
                                          : AssetImage(
                                              'assets/images/default_avatar.png',
                                            ))
                                      as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // * Note bottom last profile picture
                    MyText(
                      text: "Your last profile picture",
                      textColor: Theme.of(context).colorScheme.onSurface,
                      textSize: 12.r,
                    ),

                    // * Note bottom new profile picture
                    MyText(
                      text: isPickedFile
                          ? "Preview your profile image"
                          : "You haven't picked new picture",
                      bold: true,
                      textColor: Theme.of(context).colorScheme.onSurface,
                      textSize: 12.r,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: updateProfile,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            child: FaIcon(FontAwesomeIcons.floppyDisk),
          ),
        );
      },
      listener: (context, state) {
        if (state is ProfilePictureError) {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return MyCupertinoAlertDialog(text: state.message);
            },
          );
        }
      },
    );
  }
}
