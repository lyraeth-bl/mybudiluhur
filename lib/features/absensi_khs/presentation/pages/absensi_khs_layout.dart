import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/absensi_khs/presentation/pages/absensi/absensi_layout.dart';
import 'package:mybudiluhur/features/absensi_khs/presentation/pages/khs/khs_layout.dart';

class AbsensiKhsLayout extends StatelessWidget {
  const AbsensiKhsLayout({super.key});

  static List<Tab> myTabs = <Tab>[Tab(text: "Absensi"), Tab(text: "KHS")];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: MyText(text: "Absensi & KHS", bold: true),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[400],
          foregroundColor: Colors.white,
          bottom: TabBar(
            tabs: myTabs,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            indicatorColor: Colors.blueGrey[100],
            indicatorWeight: 5,
            automaticIndicatorColorAdjustment: true,
          ),
        ),
        body: const TabBarView(children: [AbsensiLayout(), KhsLayout()]),
      ),
    );
  }
}
