import 'package:diary_app/ui/screens/diary_screen/diary_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
