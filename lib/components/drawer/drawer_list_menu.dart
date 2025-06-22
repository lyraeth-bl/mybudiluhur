import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_cupertino_alert_dialog.dart';
import 'package:mybudiluhur/components/my_divider.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/pages/ekstrakulikuler_layout.dart';

class DrawerListMenu extends StatefulWidget {
  const DrawerListMenu({super.key});

  @override
  State<DrawerListMenu> createState() => _DrawerListMenuState();
}

class _DrawerListMenuState extends State<DrawerListMenu> {
  List<Map<String, dynamic>> listMenu = [
    {'title': 'Absensi', 'icon': Icon(Icons.date_range)},
    {'title': 'KHS', 'icon': Icon(Icons.school)},
    {'title': 'Pelajaran', 'icon': Icon(Icons.book)},
    {
      'title': 'Ekstrakurikuler',
      'icon': Icon(Icons.sports_soccer),
      'destination': () => EkstrakulikulerLayout(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: listMenu[index]['icon'],
          trailing: Icon(Icons.arrow_circle_right),
          title: MyText(text: listMenu[index]['title']),
          onTap: () {
            final destination = listMenu[index]['destination'];
            if (destination != null && destination is Function) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => destination()));
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
          const MyDivider(padding: EdgeInsets.all(0)),
      itemCount: listMenu.length,
    );
  }
}
