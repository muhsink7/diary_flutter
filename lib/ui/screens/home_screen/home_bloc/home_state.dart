part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<HomeEntry> entries;

  HomeLoadedState({required this.entries});
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState({required this.error});
}

// Diary Entry model
class HomeEntry {
  final String title;
  final String body;
  final String date;

  HomeEntry({required this.title, required this.body, required this.date});
}