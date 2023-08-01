part of 'diary_bloc.dart';

@immutable
abstract class DiaryEvent {}

class SaveDiaryEntryEvent extends DiaryEvent {
  final String title;
  final String body;

  SaveDiaryEntryEvent({required this.title, required this.body});
}