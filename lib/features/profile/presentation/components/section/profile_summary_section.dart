import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MyPageTransition.left(
            destination: DetailProfilePage(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
                  color: Colors.lightBlue[400],
                  child: MyText(
                    text: "Detail Profile",
                    textColor: Colors.white,
                    bold: true,
                    textSize: 15,
                  ),
                ),
                Icon(Icons.arrow_circle_right, color: Colors.lightBlue[400]),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        MyCard(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(text: "NIS / NISN", textColor: Colors.grey[700]),
                    MyText(
                      text:
                          '${widget.profileUser.nis} / ${widget.profileUser.nisn}',
                      bold: true,
                    ),
                  ],
                ),
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3),
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              ProfileSummaryText(title: "Nama", body: widget.profileUser.nama),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3),
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              ProfileSummaryText(
                title: "Tempat Lahir",
                body: widget.profileUser.tempLahir,
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3),
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              ProfileSummaryText(
                title: "Tanggal Lahir",
                body: widget.profileUser.tglLahir,
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3),
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              ProfileSummaryText(
                title: "Email",
                body: widget.profileUser.email,
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3),
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              ProfileSummaryText(
                title: "Kelas",
                body: widget.profileUser.kelasSaatIni,
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3),
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              ProfileSummaryText(
                title: "Aktif",
                body: widget.profileUser.aktif,
              ),
              MyDivider(
                padding: const EdgeInsets.symmetric(vertical: 3),
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
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
