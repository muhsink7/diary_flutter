import 'package:diary_app/ui/screens/home_screen/home_screen.dart';
import 'package:diary_app/ui/screens/login_screen/login_screen.dart';
import 'package:diary_app/ui/screens/register_screen/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  if (state is RegisterInitialState) {
                    // Show initial UI here
                  } else if (state is RegisterLoadingState) {
                    // Show loading UI here
                  } else if (state is RegisterSuccessState) {
                    // Navigate to HomeScreen on success
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else if (state is RegisterErrorState) {
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
                        controller: _userNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          hintText: "Username",
                        ),
                      ),
                      SizedBox(height: 20,),
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
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          hintText: "Confirm Password",
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: () {
                          String username = _userNameController.text;
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          String confirmPassword = _confirmPasswordController.text;
                          context.read<RegisterBloc>().add(RegisterButtonPressed(
                            username: username,
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                          ));
                        },
                        child: Text("Register"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text("Login"),
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
