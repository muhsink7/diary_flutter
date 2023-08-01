part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchDiaryEntriesEvent extends HomeEvent {}