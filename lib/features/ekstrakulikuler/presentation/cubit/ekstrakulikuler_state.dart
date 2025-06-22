import 'package:mybudiluhur/features/ekstrakulikuler/domain/entities/ekstrakulikuler_user.dart';

abstract class EkstrakulikulerState {}

class EkstrakulikulerInitial extends EkstrakulikulerState {}

class EkstrakulikulerLoading extends EkstrakulikulerState {}

class EkstrakulikulerLoaded extends EkstrakulikulerState {
  final List<EkstrakulikulerUser> ekstrakulikulerUser;
  EkstrakulikulerLoaded(this.ekstrakulikulerUser);
}

class EkstrakulikulerError extends EkstrakulikulerState {
  final String message;
  EkstrakulikulerError(this.message);
}
