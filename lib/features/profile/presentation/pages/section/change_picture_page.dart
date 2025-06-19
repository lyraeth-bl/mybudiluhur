import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_state.dart';

class ChangePicturePage extends StatefulWidget {
  final ProfileUser profileUser;
  const ChangePicturePage({super.key, required this.profileUser});

  @override
  State<ChangePicturePage> createState() => _ChangePicturePageState();
}

class _ChangePicturePageState extends State<ChangePicturePage> {
  // Cubit
  late final profileCubit = context.read<ProfileCubit>();

  // Logic Save Button
  void updateProfile() async {
    final nis = widget.profileUser.nis;

    await profileCubit.updateProfile(nis: nis);

    if (!mounted) return;

    Navigator.of(context).pop();
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return MyCupertinoAlertDialog(
          text: "Profile image successfully change",
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, profileState) {
        if (profileState is ProfileLoading) {
          return MyLoadingScreen(text: "Saving your profile picture...");
        }

        final isPickedFile = profileState is ProfilePickedImage;
        return Scaffold(
          appBar: AppBar(
            title: MyText(text: "Edit Profile Picture"),
            centerTitle: true,
            backgroundColor: Colors.lightBlue[400],
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: "Your Profile Picture", bold: true),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.grey[700],
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 50,
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
                    GestureDetector(
                      onTap: pickImage,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[700],
                        child: ClipOval(
                          child: CircleAvatar(
                            radius: 50,
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyText(text: "Your last profile picture"),
                    MyText(
                      text: isPickedFile
                          ? "Preview your profile image"
                          : "You haven't picked new picture",
                      bold: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: updateProfile,
                      child: MyContainer(
                        color: Colors.lightBlue[400],
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: MyText(text: "Save", textColor: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is ProfileError) {
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
