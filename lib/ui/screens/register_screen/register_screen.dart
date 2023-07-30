import 'package:diary_app/ui/screens/home_screen/home_screen.dart';
import 'package:diary_app/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    TextFormField(
                      controller: _userNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        hintText: "Username",
                      ),
                    ),
                        SizedBox(height: 20,),
                        TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          hintText: "Email",
        ),
      ),
                        SizedBox(height: 20,),
                        TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          hintText: "Password",
        ),
      ),
                        SizedBox(height: 20,),
                        TextFormField(
        controller: _confirmPasswordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          hintText: "Confirm Password",
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  LoginScreen()),
            );
          }, child: const Text("Login")),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  HomeScreen()),
            );
          }, child: const Text("Register")),
        ],
      )
    ]),
                ))));
  }
}