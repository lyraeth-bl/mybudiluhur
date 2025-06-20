import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_card.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/profile/domain/entities/detail_profile_user.dart';

class DetailProfileData extends StatefulWidget {
  final DetailProfileUser detailProfileUser;
  const DetailProfileData({super.key, required this.detailProfileUser});

  @override
  State<DetailProfileData> createState() => _DetailProfileDataState();
}

class _DetailProfileDataState extends State<DetailProfileData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                MyText(
                  text: widget.detailProfileUser.toMap().keys.elementAt(index),
                  bold: true,
                  textSize: 18,
                ),
                SizedBox(height: 10),
              ],
            ),
            subtitle: MyCard(
              padding: EdgeInsetsGeometry.zero,
              color: Colors.transparent,
              child: MyText(
                text:
                    widget.detailProfileUser
                        .toMap()
                        .values
                        .elementAt(index)
                        ?.toString() ??
                    '-',
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const MyDivider(),
        itemCount: widget.detailProfileUser.toMap().length,
      ),
    );
  }
}
