part of 'diary_bloc.dart';

@immutable
abstract class DiaryState {}

class DiaryInitialState extends DiaryState {}

class DiarySavingState extends DiaryState {}

class DiarySavedState extends DiaryState {}

class DiaryErrorState extends DiaryState {
  final String error;

  DiaryErrorState({required this.error});
}