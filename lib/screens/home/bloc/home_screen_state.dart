part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeScreenState {}

class HomeError extends HomeScreenState {
  final ApiException apiException;

  const HomeError({required this.apiException});

  @override
  List<Object?> get props => [apiException];
}

class HomeSuccess extends HomeScreenState {
  final List<Currency> currencies;

  const HomeSuccess({required this.currencies});
}
