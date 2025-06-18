import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_menu_event.dart';
part 'bottom_menu_state.dart';

class BottomMenuBloc extends Bloc<BottomMenuEvent, BottomMenuState> {
  BottomMenuBloc() : super(const BottomMenuState(currentIndex: 0)) {
    on<BottomMenuChanged>((event, emit) {
      emit(BottomMenuState(currentIndex: event.index));
    });
  }
}
