abstract class PasswordCheckState {}

class PasswordCheckInitial extends PasswordCheckState {}

class PasswordCheckLoading extends PasswordCheckState {}

class PasswordCheckSuccess extends PasswordCheckState {}

class PasswordCheckError extends PasswordCheckState {
  final String message;
  PasswordCheckError(this.message);
}
