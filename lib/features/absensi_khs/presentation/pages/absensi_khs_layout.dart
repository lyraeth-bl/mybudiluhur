import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          title: MyText(text: "Absensi & KHS", bold: true, textSize: 20.r),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          bottom: TabBar(
            tabs: myTabs,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.r),
            indicatorColor: Theme.of(context).colorScheme.surface,
            indicatorWeight: 5,
            automaticIndicatorColorAdjustment: true,
          ),
        ),
        body: const TabBarView(children: [AbsensiLayout(), KhsLayout()]),
      ),
    );
  }
}
