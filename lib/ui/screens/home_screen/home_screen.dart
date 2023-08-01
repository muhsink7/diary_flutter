import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diary_app/ui/screens/home_screen/home_bloc/home_bloc.dart';

import '../diary_screen/diary_screen.dart';
import 'home_bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Diary"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Title"),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Body"),
                    ),
                    trailing: Text("Date"),
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiaryScreen()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

