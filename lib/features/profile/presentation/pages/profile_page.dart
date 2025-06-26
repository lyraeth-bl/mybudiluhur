import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_layout.dart';
import 'package:mybudiluhur/components/my_loading_screen.dart';
import 'package:mybudiluhur/components/my_null_data_page.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/presentation/components/section/profile_botton_edit.dart';
import 'package:mybudiluhur/features/profile/presentation/components/section/profile_logout_section.dart';
import 'package:mybudiluhur/features/profile/presentation/components/section/profile_photo_section.dart';
import 'package:mybudiluhur/features/profile/presentation/components/section/profile_student_card_section.dart';
import 'package:mybudiluhur/features/profile/presentation/components/section/profile_summary_section.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Cubit
  late final profileCubit = context.read<ProfileCubit>();

  // Fetch profileUser waktu buka page
  @override
  void initState() {
    super.initState();
    profileCubit.fetchProfileUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, profileState) {
        if (profileState is ProfileLoaded) {
          final user = profileState.profileUser;
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    title: MyText(text: "Profile", bold: true),
                    centerTitle: true,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),

                  // Profile Photo
                  SliverToBoxAdapter(
                    child: ProfilePhotoSection(profileUser: user),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),

                  // Change Profile and Password
                  SliverToBoxAdapter(
                    child: ProfileBottonEdit(profileUser: user),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),

                  // Student Card
                  SliverToBoxAdapter(
                    child: ProfileStudentCardSection(profileUser: user),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),

                  // Profile Summary
                  SliverToBoxAdapter(
                    child: ProfileSummarySection(profileUser: user),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 30.h)),

                  // Logout Button
                  SliverToBoxAdapter(child: ProfileLogoutSection()),

                  SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                ],
              ),
            ],
          );
        }
        if (profileState is ProfileNull) {
          return MyLayout(
            title: "Profile",
            body: MyNullDataPage(message: "Profile data not found..."),
          );
        } else {
          return MyLoadingScreen(
            text: "Loading your profile...",
            title: "Profile",
          );
        }
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
