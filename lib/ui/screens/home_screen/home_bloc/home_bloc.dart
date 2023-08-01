import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchDiaryEntriesEvent) {
      yield HomeLoadingState();

      // Simulate fetching diary entries from a database or API
      await Future.delayed(Duration(seconds: 2));

      // Replace the dummy entries with actual data fetched from the database
      List<HomeEntry> entries = List.generate(10, (index) {
        return HomeEntry(
          title: "Title $index",
          body: "Body $index",
          date: "Date $index",
        );
      });

      yield HomeLoadedState(entries: entries);
    }
  }
}
