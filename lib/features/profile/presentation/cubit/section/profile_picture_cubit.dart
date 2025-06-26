import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/profile_picture_state.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit() : super(ProfilePictureInitial());
  bool imageSelected = false;

  void setSelectedImage() {
    imageSelected = true;
    emit(ProfilePictureSuccess(imageSelected));
  }

  void reset() {
    emit(ProfilePictureInitial());
  }
}
