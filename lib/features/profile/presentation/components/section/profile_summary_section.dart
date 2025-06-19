import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/components/my_card.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/presentation/components/profile_summary_text.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileSummarySection extends StatelessWidget {
  const ProfileSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final profileUserData = context.read<ProfileCubit>().currentProfileUser!;
    return MyCard(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: "NIS / NISN", textColor: Colors.grey[700]),
                MyText(
                  text: '${profileUserData.nis} / ${profileUserData.nisn}',
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
          ProfileSummaryText(title: "Nama", body: profileUserData.nama),
          MyDivider(
            padding: const EdgeInsets.symmetric(vertical: 3),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          ProfileSummaryText(
            title: "Tempat Lahir",
            body: profileUserData.tempLahir,
          ),
          MyDivider(
            padding: const EdgeInsets.symmetric(vertical: 3),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          ProfileSummaryText(
            title: "Tanggal Lahir",
            body: profileUserData.tglLahir,
          ),
          MyDivider(
            padding: const EdgeInsets.symmetric(vertical: 3),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          ProfileSummaryText(title: "Email", body: profileUserData.email),
          MyDivider(
            padding: const EdgeInsets.symmetric(vertical: 3),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          ProfileSummaryText(
            title: "Kelas",
            body: profileUserData.kelasSaatIni,
          ),
          MyDivider(
            padding: const EdgeInsets.symmetric(vertical: 3),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          ProfileSummaryText(title: "Aktif", body: profileUserData.aktif),
          MyDivider(
            padding: const EdgeInsets.symmetric(vertical: 3),
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          ProfileSummaryText(title: "Status", body: profileUserData.statLulus),
        ],
      ),
    );
  }
}
