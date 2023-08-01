import 'package:diary_app/ui/screens/home_screen/home_screen.dart';
import 'package:diary_app/ui/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginInitialState) {
                    // Show initial UI here
                  } else if (state is LoginLoadingState) {
                    // Show loading UI here
                  } else if (state is LoginSuccessState) {
                    // Navigate to HomeScreen on success
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else if (state is LoginErrorState) {
                    // Show error message here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          hintText: "Email",
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          hintText: "Password",
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: () {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          context.read<LoginBloc>().add(LoginButtonPressed(email: email, password: password));
                        },
                        child: Text("Login"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text("Register"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
