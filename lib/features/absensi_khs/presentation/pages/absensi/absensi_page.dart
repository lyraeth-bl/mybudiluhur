import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; // pastikan sudah import intl di pubspec.yaml
import 'package:mybudiluhur/components/my_card.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/absensi_khs/domain/entities/absensi_user.dart';

class AbsensiPage extends StatefulWidget {
  final List<AbsensiUser> absensiUser;
  const AbsensiPage({super.key, required this.absensiUser});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  late final Map<String, List<AbsensiUser>> groupedAbsensi;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    // 1. Sort data ascending by tanggal
    widget.absensiUser.sort((a, b) {
      final dateA = DateTime.tryParse(a.tanggal) ?? DateTime(2000);
      final dateB = DateTime.tryParse(b.tanggal) ?? DateTime(2000);
      return dateA.compareTo(dateB);
    });

    // 2. Group data by tahun ajaran + semester
    groupedAbsensi = {};
    for (final item in widget.absensiUser) {
      final groupKey = "${item.tajaran} - Semester ${item.semester}";
      if (groupedAbsensi[groupKey] == null) groupedAbsensi[groupKey] = [];
      groupedAbsensi[groupKey]!.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy');

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
        children: [
          for (final entry in groupedAbsensi.entries) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10).r,
              child: Row(
                children: [
                  MyContainer(
                    color: Theme.of(context).colorScheme.surface,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ).r,
                    child: MyText(
                      text: entry.key,
                      bold: true,
                      textSize: 14.r,
                      textColor: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            ...entry.value.map((absensiUser) {
              final dateText = DateTime.tryParse(absensiUser.tanggal) != null
                  ? dateFormat.format(DateTime.parse(absensiUser.tanggal))
                  : absensiUser.tanggal;

              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0).r,
                child: MyCard(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  color: Theme.of(context).colorScheme.surface,
                  borderColor: Theme.of(context).colorScheme.onInverseSurface,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // * Tags
                          MyContainer(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ).r,
                            color: _getStatusColor(
                              absensiUser.alasanKetidakhadiran,
                            ),
                            child: MyText(
                              text: absensiUser.alasanKetidakhadiran,
                              bold: true,
                              textColor: Colors.white,
                              textSize: 14.r,
                            ),
                          ),
                          SizedBox(width: 15.w),

                          // * Tanggal
                          MyText(
                            text: dateText,
                            textSize: 14.r,
                            bold: true,
                            textColor: Theme.of(context).colorScheme.tertiary,
                          ),
                          const Spacer(),

                          // * Kelas
                          MyText(
                            text: absensiUser.kelas,
                            textColor: Theme.of(context).colorScheme.onSurface,
                            textSize: 16.r,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      if (absensiUser.keterangan.isNotEmpty ||
                          absensiUser.jamTerlambat.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0).r,
                          child: Row(
                            children: [
                              if (absensiUser.keterangan.isNotEmpty)
                                // * Keterangan
                                Text(
                                  "Ket: ${absensiUser.keterangan}",
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.tertiary,
                                    fontSize: 14.r,
                                  ),
                                ),
                              if (absensiUser.jamTerlambat.isNotEmpty) ...[
                                SizedBox(width: 16.w),

                                // * Terlambar
                                Text(
                                  "Terlambat: ${absensiUser.jamTerlambat}",
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.tertiary,
                                    fontSize: 14.r,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  Color _getStatusColor(String alasan) {
    switch (alasan.toLowerCase()) {
      case 'alpha':
        return Colors.redAccent.shade200;
      case 'izin':
        return Colors.orange.shade400;
      case 'sakit':
        return Colors.blue.shade400;
      case 'telat':
        return Colors.red.shade400;
      default:
        return Colors.grey;
    }
  }
}
