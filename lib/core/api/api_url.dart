/// Kelas `ApiUrl` berfungsi sebagai tempat penyimpanan URL dasar (base URL)
/// untuk berbagai endpoint API yang digunakan dalam aplikasi.
///
/// Properti:
/// - [authBaseUrl]: URL endpoint untuk proses autentikasi (login).
/// - [profileBaseUrl]: URL endpoint untuk mengambil data profil siswa.
/// - [absensiBaseUrl]: URL endpoint untuk melakukan filter data absensi siswa.
///
/// Semua properti bersifat statis dan konstan sehingga dapat diakses tanpa
/// perlu membuat instance dari kelas ini.
class ApiUrl {
  static const authBaseUrl =
      'https://laravelbackend.jh-beon.cloud/smk/public/api/login';
  static const profileBaseUrl =
      'https://laravelbackend.jh-beon.cloud/smk/public/api/siswa';
  static const absensiBaseUrl =
      'https://laravelbackend.jh-beon.cloud/smk/public/api/absensi/filter';
}
