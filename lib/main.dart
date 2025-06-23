import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/budi_luhur_app.dart';
import 'package:mybudiluhur/core/api/firebase/firebase_api.dart';
import 'package:mybudiluhur/core/dependency_injection.dart';
import 'package:mybudiluhur/firebase_options.dart';
import 'package:path_provider/path_provider.dart';

/// Fungsi utama aplikasi yang dijalankan pertama kali.
///
/// Langkah-langkah yang dilakukan di dalam fungsi ini:
/// 1. [WidgetsFlutterBinding.ensureInitialized]
///    - Menginisialisasi binding Flutter agar dapat menjalankan kode asinkron sebelum aplikasi dijalankan.
/// 2. [Firebase.initializeApp]
///    - Menginisialisasi Firebase dengan konfigurasi sesuai platform yang digunakan.
/// 3. [FirebaseApi.initNotification]
///    - Menginisialisasi notifikasi menggunakan API Firebase yang telah dibuat.
/// 4. [HydratedBloc.storage]
///    - Mengatur penyimpanan state untuk HydratedBloc.
///    - Jika dijalankan di web, menggunakan direktori khusus web.
///    - Jika dijalankan di platform lain, menggunakan direktori dokumen aplikasi.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );
  DependencyInjection.init();

  runApp(const BudiLuhurApp());
}
