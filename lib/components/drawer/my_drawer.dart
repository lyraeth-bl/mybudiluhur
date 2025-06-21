import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/drawer/drawer_list_menu.dart';
import 'package:mybudiluhur/components/drawer/drawer_photo_profile.dart';
import 'package:mybudiluhur/components/my_divider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Photo Profile
            DrawerPhotoProfile(),
            MyDivider(padding: EdgeInsets.all(0)),
            Expanded(child: DrawerListMenu()),
          ],
        ),
      ),
    );
  }
}
