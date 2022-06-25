import 'package:deaf_mute_clinic/helper/notifications.dart';
import 'package:deaf_mute_clinic/helper/routs/routs_name.dart';
import 'package:deaf_mute_clinic/view_model/authontcation/cubit/regestration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_form_feild.dart';

class LogInScreenForDoctor extends StatefulWidget {
  const LogInScreenForDoctor({Key? key}) : super(key: key);

  @override
  State<LogInScreenForDoctor> createState() => _LogInScreenForDoctorState();
}

class _LogInScreenForDoctorState extends State<LogInScreenForDoctor> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is DoctorLoginErrorState) {
          final snackBar = SnackBar(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            backgroundColor: Colors.red,
            content: Text(state.error.toString()),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is DoctorLoginSuccessState) {
          Navigator.pushNamed(context, RoutsNames.doctorHome);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          body: Container(
            margin: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                key: formKey,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12, right: 105),
                    child: CustomText(
                      text: "Login in your account",
                      color: Colors.black,
                      fontSise: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    controller: emailController,
                    validation: (String value) {
                      if (value.isEmpty) {
                        return 'password is too short';
                      }
                    },
                    lableText: "Email",
                    prefexIcon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    isPassward: RegistrationCubit.get(context).isPassword,
                    controller: passwordController,
                    validation: (String value) {
                      if (value.isEmpty) {
                        return 'password is too short';
                      }
                    },
                    lableText: "Password",
                    prefexIcon: Icons.lock_outlined,
                    sufixIcon: RegistrationCubit.get(context).suffix,
                    suffixOnTap: () {
                      RegistrationCubit.get(context).changePasswordVisibility();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                  state is DoctorLoginLoadingState
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "Log In",
                          ontap: () {
                            //  if (formKey.currentState!.validate()) {
                            validationInput(context);
                          }
                          //   },
                          ,
                          height: 50,
                          width: 260,
                        ),
                  const SizedBox(
                    height: 18.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void validationInput(BuildContext context) {
    if (emailController.text.isEmpty ||
        !emailController.text.contains('doctor') ||
        !emailController.text.contains('@')) {
      Notifications.error('You must enter correct email and contains doctor');
    } else if (passwordController.text.isEmpty) {
      Notifications.error('you must enter correct password');
    } else {
      RegistrationCubit.get(context).doctorLogIn(
          email: emailController.text, password: passwordController.text);
    }
  }
}
