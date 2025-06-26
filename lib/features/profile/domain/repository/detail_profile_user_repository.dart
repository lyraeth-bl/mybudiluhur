import 'package:mybudiluhur/features/profile/domain/entities/detail_profile_user.dart';

abstract class DetailProfileUserRepository {
  Future<DetailProfileUser?> fetchDetailProfileUser();
}
