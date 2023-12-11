import 'package:clinic_app/ClinicCubits/Resister_Cubit/cubit/register_cubit.dart';
import 'package:clinic_app/Pages/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_form.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwardController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: BlocConsumer<RegisterCubitCubit, RegisterCubitState>(
            listener: (context, state) {
              if (state is RegisterSucessState) {
                Navigator.pop(context);
              } else if (state is RegisterFailureState) {
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
                      height: 70,
                    ),
                    Text(
                      'Let’s get started!',
                      style: TextStyle(color: Color(0xff030E19), fontSize: 34),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'create an account and start booking now.',
                      style: TextStyle(
                          color: Color(0xff030E19), fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextForm(
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    CustomTextForm(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    CustomTextForm(
                      hintText: 'Phone',
                      controller: phoneController,
                    ),
                    CustomTextForm(
                      hintText: 'Passward',
                      controller: passwardController,
                    ),
                    CustomTextForm(
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                    ),
                    Row(
                      children: [
                        Radio(
                            value: '0',
                            groupValue: selectedGender,
                            onChanged: (val) {
                              setState(() {
                                selectedGender = val.toString();
                              });
                            }),
                        Text(
                          'Male',
                          style: TextStyle(fontSize: 16),
                        ),
                        Radio(
                            value: '1',
                            groupValue: selectedGender,
                            onChanged: (val) {
                              setState(() {
                                selectedGender = val.toString();
                              });
                            }),
                        Text(
                          'Female',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginPage.id);
                            },
                            child: Text(
                              'Login here.',
                              style: TextStyle(color: Color(0xff030E19)),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomButton(
                      text: state is RegisterLoadingState
                          ? 'Loading.....'
                          : 'REGISTER',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubitCubit>(context).register(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwardController.text,
                              passwordConfirmation:
                                  confirmPasswordController.text,
                              gender: selectedGender!);
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
