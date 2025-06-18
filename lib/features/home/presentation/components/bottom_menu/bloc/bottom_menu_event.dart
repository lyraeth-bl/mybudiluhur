part of 'bottom_menu_bloc.dart';

sealed class BottomMenuEvent extends Equatable {
  const BottomMenuEvent();

  @override
  List<Object?> get props => [];
}

class BottomMenuChanged extends BottomMenuEvent {
  final int index;
  const BottomMenuChanged(this.index);

  @override
  List<Object?> get props => [index];
}
