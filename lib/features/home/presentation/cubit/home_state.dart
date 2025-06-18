import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeUser homeUser;
  HomeLoaded(this.homeUser);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
