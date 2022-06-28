import 'package:deaf_mute_clinic/helper/notifications.dart';
import 'package:deaf_mute_clinic/view_model/authontcation/cubit/regestration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/routs/routs_name.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_form_feild.dart';

class SignUpScreenForPatient extends StatefulWidget {
  @override
  State<SignUpScreenForPatient> createState() => _SignUpScreenForPatientState();
}

class _SignUpScreenForPatientState extends State<SignUpScreenForPatient> {
  //AuthBloc authBloc = AuthBloc();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var emergencyContactName = TextEditingController();
  var emergencyContactPhone = TextEditingController();
  var emergencyContactAddress = TextEditingController();
  var emergencyContactTypeOfKinship = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return RegistrationCubit();
      },
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is PatientSigUpErrorState) {
            final snackBar = SnackBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              backgroundColor: Colors.red,
              content: Text(state.error.toString()),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is PatientSigUpSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutsNames.patientRecord,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            body: Container(
              margin: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 12, right: 10),
                        child: CustomText(
                          text: "Let's care about our health",
                          color: Color(
                            0xff292929,
                          ),
                          fontSise: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: nameController,
                                lableText: "Name",
                                prefexIcon: Icons.person),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextField(
                              controller: emailController,
                              lableText: "Email",
                              prefexIcon: Icons.email_outlined,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextField(
                              isPassward:
                                  RegistrationCubit.get(context).isPassword,
                              suffixOnTap: () {
                                RegistrationCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              controller: passwordController,
                              lableText: "Create password",
                              prefexIcon: Icons.lock_outlined,
                              sufixIcon: RegistrationCubit.get(context).suffix,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextField(
                              keyBordType: TextInputType.phone,
                              controller: phoneController,
                              lableText: "Phone",
                              prefexIcon: Icons.phone_android_outlined,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const CustomText(
                              color: Colors.black,
                              text: 'Emergency Contact',
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextField(
                              keyBordType: TextInputType.name,
                              controller: emergencyContactName,
                              lableText: "Name",
                              prefexIcon: Icons.person,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextField(
                              keyBordType: TextInputType.phone,
                              controller: emergencyContactPhone,
                              lableText: "Phone",
                              prefexIcon: Icons.phone,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextField(
                              keyBordType: TextInputType.text,
                              controller: emergencyContactAddress,
                              lableText: "Address",
                              prefexIcon: Icons.home,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomTextField(
                              keyBordType: TextInputType.text,
                              controller: emergencyContactTypeOfKinship,
                              lableText: "Type Of Kinship",
                              prefexIcon: Icons.person,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70.0,
                    ),
                    state is PatientSigUpLoadingState
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: "Sign Up",
                            ontap: () {
                              validationInput(context);
                            },
                            height: 50,
                            width: 260,
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  validationInput(BuildContext context) {
    if (emailController.text.isEmpty ||
        emailController.text.contains('doctor') ||
        !emailController.text.contains('@')) {
      Notifications.error('You must enter correct email and contains doctor');
    } else if (passwordController.text.isEmpty) {
      Notifications.error('you must enter correct password');
    } else if (nameController.text.isEmpty) {
      Notifications.error('you must enter correct name');
    } else if (emergencyContactName.text.isEmpty) {
      Notifications.error('you must enter correct name');
    } else if (emergencyContactAddress.text.isEmpty) {
      Notifications.error('you must enter correct address');
    } else if (emergencyContactPhone.text.isEmpty) {
      Notifications.error('you must enter correct phone');
    } else if (emergencyContactTypeOfKinship.text.isEmpty) {
      Notifications.error('you must enter correct type of kinship');
    } else {
      RegistrationCubit.get(context).patientSignUp(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text,
        emergencyContactName: emergencyContactName.text,
        emergencyContactPhoneNumber: emergencyContactPhone.text,
        emergencyContactAddress: emergencyContactAddress.text,
        emergencyContactTypeOfKinship: emergencyContactTypeOfKinship.text,
      );
    }
  }
}
