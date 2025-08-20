import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class BottomNavigationEvent {}

class BottomNavigationIndexChanged extends BottomNavigationEvent {
  final int newIndex;

  BottomNavigationIndexChanged(this.newIndex);
}

class BottomNavigationReset extends BottomNavigationEvent {}

// States
abstract class BottomNavigationState {
  final int currentIndex;

  const BottomNavigationState({required this.currentIndex});
}

class BottomNavigationInitial extends BottomNavigationState {
  const BottomNavigationInitial() : super(currentIndex: 0);
}

class BottomNavigationUpdated extends BottomNavigationState {
  const BottomNavigationUpdated({required super.currentIndex});
}

// BLoC
class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationInitial()) {
    on<BottomNavigationIndexChanged>(_onIndexChanged);
    on<BottomNavigationReset>(_onReset);
  }

  void _onIndexChanged(
    BottomNavigationIndexChanged event,
    Emitter<BottomNavigationState> emit,
  ) {
    emit(BottomNavigationUpdated(currentIndex: event.newIndex));
  }

  void _onReset(
    BottomNavigationReset event,
    Emitter<BottomNavigationState> emit,
  ) {
    emit(const BottomNavigationUpdated(currentIndex: 0));
  }
}
