import 'package:mybudiluhur/features/forum/domain/entities/forum_app.dart';

abstract class ForumState {}

class ForumInitial extends ForumState {}

class ForumLoading extends ForumState {}

class ForumLoaded extends ForumState {
  final List<ForumApp> forumApp;
  ForumLoaded(this.forumApp);
}

class ForumNull extends ForumState {}

class ForumError extends ForumState {
  final String message;
  ForumError(this.message);
}
