import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class HomeEvent {}

class HomeInitialized extends HomeEvent {}

class HomeRefresh extends HomeEvent {}

// States
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  const HomeLoaded();
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}

// BLoC
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HomeInitialized>(_onHomeInitialized);
    on<HomeRefresh>(_onHomeRefresh);
  }

  Future<void> _onHomeInitialized(
    HomeInitialized event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    try {
      // Simulate API call or data loading
      await Future.delayed(const Duration(milliseconds: 500));
      emit(const HomeLoaded());
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onHomeRefresh(
    HomeRefresh event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    try {
      // Simulate API call or data loading
      await Future.delayed(const Duration(milliseconds: 500));
      emit(const HomeLoaded());
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
