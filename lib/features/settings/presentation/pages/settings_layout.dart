import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/settings/presentation/pages/settings_page.dart';

class SettingsLayout extends StatelessWidget {
  const SettingsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: "Settings", bold: true),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
      ),
      body: SettingsPage(),
    );
  }
}
