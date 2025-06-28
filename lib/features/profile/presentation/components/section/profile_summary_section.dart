import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_card.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_page_transition.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';
import 'package:mybudiluhur/features/profile/presentation/components/profile_summary_text.dart';
import 'package:mybudiluhur/features/profile/presentation/pages/section/detail_profile_page.dart';

class ProfileSummarySection extends StatefulWidget {
  final ProfileUser profileUser;
  const ProfileSummarySection({super.key, required this.profileUser});

  @override
  State<ProfileSummarySection> createState() => _ProfileSummarySectionState();
}

class _ProfileSummarySectionState extends State<ProfileSummarySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).r,
          child: MyPageTransition.left(
            destination: DetailProfilePage(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // * Navigation Detail Profile
                MyContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ).r,
                  color: Theme.of(context).colorScheme.primary,
                  child: MyText(
                    text: "Detail Profile",
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    bold: true,
                    textSize: 14.r,
                  ),
                ),
                Icon(
                  Icons.arrow_circle_right,
                  size: 30.r,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),

        // * Card Summary Profile
        MyCard(
          color: Theme.of(context).colorScheme.surface,
          borderColor: Theme.of(context).colorScheme.onInverseSurface,
          child: Column(
            children: [
              // * NIS dan NISN
              ProfileSummaryText(
                title: "NIS / NISN",
                body: '${widget.profileUser.nis} / ${widget.profileUser.nisn}',
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3).r,
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(15).r,
              ),

              // * Nama
              ProfileSummaryText(title: "Nama", body: widget.profileUser.nama),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3).r,
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(15).r,
              ),

              // * Tempat dan Tanggal Lahir
              ProfileSummaryText(
                title: "Tempat dan Tanggal Lahir",
                body:
                    '${widget.profileUser.tempLahir}, ${widget.profileUser.tglLahir}',
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3).r,
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(15).r,
              ),

              // * Email
              ProfileSummaryText(
                title: "Email",
                body: widget.profileUser.email,
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3).r,
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(15).r,
              ),

              // * Kelas
              ProfileSummaryText(
                title: "Kelas",
                body: widget.profileUser.kelasSaatIni,
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3).r,
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(15).r,
              ),

              // * Aktif
              ProfileSummaryText(
                title: "Aktif",
                body: widget.profileUser.aktif,
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3).r,
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(15).r,
              ),

              // * Status
              ProfileSummaryText(
                title: "Status",
                body: widget.profileUser.statLulus,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
