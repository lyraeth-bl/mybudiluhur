import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/drawer/my_drawer.dart';
import 'package:mybudiluhur/components/my_text.dart';

class MyLayout extends StatelessWidget {
  final String title;
  final Widget? body;
  const MyLayout({super.key, required this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: title, bold: true),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: body,
      drawer: MyDrawer(),
    );
  }
}
