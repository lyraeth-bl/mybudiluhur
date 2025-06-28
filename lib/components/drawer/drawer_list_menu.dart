import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/absensi_khs/presentation/pages/absensi_khs_layout.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/pages/ekstrakulikuler_layout.dart';
import 'package:mybudiluhur/features/forum/presentation/pages/forum_page.dart';
import 'package:mybudiluhur/features/settings/presentation/pages/settings_layout.dart';

class DrawerListMenu extends StatefulWidget {
  const DrawerListMenu({super.key});

  @override
  State<DrawerListMenu> createState() => _DrawerListMenuState();
}

class _DrawerListMenuState extends State<DrawerListMenu> {
  List<Map<String, dynamic>> listMenu = [
    {
      'title': 'Absensi & KHS',
      'icon': Icon(Icons.date_range, color: Colors.blueGrey[400]),
      'destination': () => AbsensiKhsLayout(),
    },
    {
      'title': 'Forum',
      'icon': Icon(Icons.forum, color: Colors.blueGrey[400]),
      'destination': () => ForumPage(),
    },
    {
      'title': 'Ekstrakurikuler',
      'icon': Icon(Icons.sports_soccer, color: Colors.blueGrey[400]),
      'destination': () => EkstrakulikulerLayout(),
    },
    {
      'title': 'Settings',
      'icon': Icon(Icons.settings, color: Colors.blueGrey[400]),
      'destination': () => SettingsLayout(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: listMenu[index]['icon'],
          trailing: Icon(Icons.arrow_circle_right, color: Colors.blueGrey[400]),
          title: MyText(
            text: listMenu[index]['title'],
            textColor: Theme.of(context).colorScheme.onSurface,
            bold: true,
          ),
          onTap: () {
            final destination = listMenu[index]['destination'];
            if (destination != null && destination is Function) {
              Navigator.of(
                context,
              ).push(CupertinoPageRoute(builder: (context) => destination()));
            } else {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return MyCupertinoAlertDialog(text: "Menu belum tersedia");
                },
              );
            }
          },
        );
      },
      separatorBuilder: (context, index) =>
          const MyDivider(padding: EdgeInsets.zero),
      itemCount: listMenu.length,
    );
  }
}
