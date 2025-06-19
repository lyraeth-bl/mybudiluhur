import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_text.dart';

class ProfileSummaryText extends StatelessWidget {
  final String title;
  final String body;
  const ProfileSummaryText({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(text: title, textColor: Colors.grey[700]),
          MyText(text: body, bold: true),
        ],
      ),
    );
  }
}
