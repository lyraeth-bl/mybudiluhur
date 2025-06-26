import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateCubit extends Cubit<String> {
  DateCubit() : super(getDate(DateTime.now()));

  static String getDate(DateTime now) {
    return DateFormat('d MMMM y').format(now);
  }
}
