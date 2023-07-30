import 'package:diary_app/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

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
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Dear Diary"),
      ),
      body: SafeArea(child: Center(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[
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
                      hintText: "Title",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomeScreen()),
              );
            }, child: const Text("Save")),
          ]

        ),
      )),),
      
    );
  }
}
