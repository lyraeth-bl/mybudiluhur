import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// File ini mendefinisikan instance [FlutterSecureStorage]
/// yang digunakan untuk menyimpan data secara aman di perangkat.
///
/// [FlutterSecureStorage] memungkinkan penyimpanan data sensitif seperti token,
/// password, atau informasi penting lainnya dengan enkripsi.
///
/// Instance [secureStorage] dapat digunakan di seluruh aplikasi untuk
/// melakukan operasi penyimpanan, pembacaan, dan penghapusan data secara aman.

final FlutterSecureStorage secureStorage = FlutterSecureStorage();
