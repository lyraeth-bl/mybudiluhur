import 'package:flutter_bloc/flutter_bloc.dart';

class DaysCubit extends Cubit<String> {
  DaysCubit() : super(getDays(DateTime.now()));

  static String getDays(DateTime now) {
    if (now.weekday == 1) return "Monday";
    if (now.weekday == 2) return "Tuesday";
    if (now.weekday == 3) return "Wednesday";
    if (now.weekday == 4) return "Thursday";
    if (now.weekday == 5) return "Friday";
    if (now.weekday == 6) return "Saturday";
    return "Sunday";
  }
}
