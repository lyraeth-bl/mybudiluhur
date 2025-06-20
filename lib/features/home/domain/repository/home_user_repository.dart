import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';

abstract class HomeUserRepository {
  Future<HomeUser?> fetchHomeUserData(String nis);
}
