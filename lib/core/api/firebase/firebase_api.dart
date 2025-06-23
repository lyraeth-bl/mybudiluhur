import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mybudiluhur/budi_luhur_app.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  // Fungsi untuk inisialisasi Notifikasi
  Future<void> initNotification() async {
    // Request permission dari user
    await _firebaseMessaging.requestPermission();

    // Fetch FCM Token untuk device user
    final fCMToken = await _firebaseMessaging.getToken();

    // Print token
    //
    // TODO: Token ini harusnya di store langsung ke DB
    // yang nantinya token ini digunakan Firebase untuk mengirim notifikasi
    // ke device user
    //
    print("Token FCM Device : $fCMToken");

    initPushNotification();
  }

  // Fungsi untuk mengatur notifikasi yang masuk
  void handleMessage(RemoteMessage? message) {
    // Kalo messagenya null, tidak melakukan apa apa
    if (message == null) return;

    // arahkan user ke page baru ketika user dapat notifikasi
    // dan klik notifikasi tersebut
    navigatorKey.currentState?.pushNamed(
      '/notification_page',
      arguments: message,
    );
  }

  // Fungsi untuk inisialisasi background setting
  Future initPushNotification() async {
    // handle notifikasi jika aplikasi ditutup dan kemudian dibuka
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners ketika notifikasi membuat aplikasi terbuka
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
