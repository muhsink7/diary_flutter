import 'package:diary_app/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_bloc/diary_bloc.dart';

class DiaryScreen extends StatefulWidget {
  DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiaryBloc>(
      create: (context) => DiaryBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dear Diary"),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      hintText: "Title",
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: bodyController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: "Body",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      String title = titleController.text;
                      String body = bodyController.text;
                      context.read<DiaryBloc>().add(SaveDiaryEntryEvent(
                        title: title,
                        body: body,
                      ));
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

