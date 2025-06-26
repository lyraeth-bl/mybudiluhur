import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileUser profileUser;
  ProfileLoaded(this.profileUser);
}

class ProfileNull extends ProfileState {}

class ProfilePasswordRight extends ProfileState {
  bool isCheckedRight;
  ProfilePasswordRight(this.isCheckedRight);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
