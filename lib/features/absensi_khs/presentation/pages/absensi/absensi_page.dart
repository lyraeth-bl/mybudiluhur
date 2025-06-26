import 'package:flutter/material.dart';
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

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        for (final entry in groupedAbsensi.entries) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              children: [
                MyContainer(
                  color: Colors.blueGrey[100],
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: MyText(
                    text: entry.key,
                    bold: true,
                    textSize: 16,
                    textColor: Colors.black,
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
              padding: const EdgeInsets.only(bottom: 10.0),
              child: MyCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MyContainer(
                          color: _getStatusColor(
                            absensiUser.alasanKetidakhadiran,
                          ),
                          child: MyText(
                            text: absensiUser.alasanKetidakhadiran,
                            bold: true,
                            textColor: Colors.white,
                            textSize: 20,
                          ),
                        ),
                        const SizedBox(width: 15),
                        MyText(text: dateText, textSize: 18, bold: true),
                        const Spacer(),
                        MyText(
                          text: absensiUser.kelas,
                          textColor: Colors.grey[700],
                          textSize: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (absensiUser.keterangan.isNotEmpty ||
                        absensiUser.jamTerlambat.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            if (absensiUser.keterangan.isNotEmpty)
                              Text(
                                "Ket: ${absensiUser.keterangan}",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                              ),
                            if (absensiUser.jamTerlambat.isNotEmpty) ...[
                              const SizedBox(width: 16),
                              Text(
                                "Terlambat: ${absensiUser.jamTerlambat}",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
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
    );
  }

  Color _getStatusColor(String alasan) {
    switch (alasan.toLowerCase()) {
      case 'alpha':
        return Colors.red;
      case 'izin':
        return Colors.orange;
      case 'sakit':
        return Colors.blue;
      case 'telat':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}
