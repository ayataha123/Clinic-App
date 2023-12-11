import 'package:clinic_app/ClinicCubits/Login_Cubit/cubit/login_cubit.dart';
import 'package:clinic_app/Pages/home_page.dart';
import 'package:clinic_app/Pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static String id = 'LoginPage';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if(state is LoginSucessState)
              {
                Navigator.pushNamed(context, HomePage.id);
              }else if(state is LoginFailureState)
              {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          state.message,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      );
                    });
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(color: Color(0xff030E19), fontSize: 34),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Login to access your assigned tasks\n           and personal overview.',
                      style: TextStyle(
                          color: Color(0xff030E19), fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextForm(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    CustomTextForm(
                      hintText: 'Password',
                      controller: passwardController,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Text(
                          'Keep me logged in',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('No account yet?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: Text(
                              'Register here.',
                              style: TextStyle(color: Color(0xff030E19)),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      text:state is LoginLoadingState?'Loading....': 'LOGIN',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).login(
                                    email: emailController.text,
                                    password: passwardController.text);
                              }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
