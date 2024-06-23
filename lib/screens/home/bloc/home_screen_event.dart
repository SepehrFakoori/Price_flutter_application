part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable{
  const HomeScreenEvent();

  @override
  List<Object?> get props => [];
}

class HomeStarted extends HomeScreenEvent {}

class HomeRefresh extends HomeScreenEvent {}
