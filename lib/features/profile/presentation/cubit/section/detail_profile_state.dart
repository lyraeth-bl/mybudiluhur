import 'package:mybudiluhur/features/profile/domain/entities/detail_profile_user.dart';

abstract class DetailProfileState {}

class DetailProfileInitial extends DetailProfileState {}

class DetailProfileLoading extends DetailProfileState {}

class DetailProfileLoaded extends DetailProfileState {
  final DetailProfileUser detailProfileUser;
  DetailProfileLoaded(this.detailProfileUser);
}

class DetailProfileError extends DetailProfileState {
  final String message;
  DetailProfileError(this.message);
}
