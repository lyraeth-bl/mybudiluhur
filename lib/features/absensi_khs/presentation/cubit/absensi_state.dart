import 'package:mybudiluhur/features/absensi_khs/domain/entities/absensi_user.dart';

abstract class AbsensiState {}

class AbsensiInitial extends AbsensiState {}

class AbsensiLoading extends AbsensiState {}

class AbsensiLoaded extends AbsensiState {
  final List<AbsensiUser> absensiUser;
  AbsensiLoaded(this.absensiUser);
}

class AbsensiNull extends AbsensiState {}

class AbsensiError extends AbsensiState {
  final String message;
  AbsensiError(this.message);
}
