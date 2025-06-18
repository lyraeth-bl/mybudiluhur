import 'package:flutter/material.dart';
import 'package:mybudiluhur/features/home/presentation/components/bottom_menu/bottom_navigation_menu.dart.dart';
import 'package:mybudiluhur/features/home/presentation/pages/home_page.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyBudiLuhur")),
      body: HomePage(),
      bottomNavigationBar: BottomNavigationMenu(),
    );
  }
}
