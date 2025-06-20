import 'package:bloc/bloc.dart';

class GreetingsCubit extends Cubit<String> {
  GreetingsCubit() : super(greetings(DateTime.now()));

  static String greetings(DateTime now) {
    if (now.hour >= 3 && now.hour < 9) return "Good Morning,";
    if (now.hour >= 9 && now.hour < 18) return "Good Afternoon,";
    return "Good Night,";
  }
}
