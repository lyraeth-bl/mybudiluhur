abstract class ProfilePictureState {}

class ProfilePictureInitial extends ProfilePictureState {}

class ProfilePictureLoading extends ProfilePictureState {}

class ProfilePictureSuccess extends ProfilePictureState {
  bool? imageSelected;
  ProfilePictureSuccess(this.imageSelected);
}

class ProfilePictureError extends ProfilePictureState {
  final String message;
  ProfilePictureError(this.message);
}
