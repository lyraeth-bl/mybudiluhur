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
          title: MyText(text: "Absensi & KHS", bold: true),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          bottom: TabBar(
            tabs: myTabs,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
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
