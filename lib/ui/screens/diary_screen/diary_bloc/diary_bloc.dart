import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(DiaryInitialState());

  @override
  Stream<DiaryState> mapEventToState(DiaryEvent event) async* {
    if (event is SaveDiaryEntryEvent) {
      emit(DiarySavingState());

      // Simulate saving diary entry to a database or API
      await Future.delayed(Duration(seconds: 2));

      // Validate and save the diary entry (Replace with your actual saving logic)
      if (event.title.isEmpty || event.body.isEmpty) {
        yield DiaryErrorState(error: "Title and Body cannot be empty");
      } else {
        yield DiarySavedState();
      }
    }
  }
}