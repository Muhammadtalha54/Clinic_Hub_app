import 'package:clinic_hub_app/Shared_screens/Viewmodel/Controllers/Patientcontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clinic_hub_app/Shared_screens/Resources/components/customtextfield.dart';
import 'package:clinic_hub_app/Shared_screens/Resources/components/datepicker.dart';
import 'package:clinic_hub_app/Shared_screens/Resources/components/passwordtextfield.dart';
import 'package:clinic_hub_app/Shared_screens/View/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/Shared_screens/View/Verificationscreen/verifyemail.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';

class Usersignupscreen extends StatefulWidget {
  Usersignupscreen({super.key});

  @override
  State<Usersignupscreen> createState() => _UsersignupscreenState();
}

class _UsersignupscreenState extends State<Usersignupscreen> {
  final PatientSignupController patientcontroller =
      Get.put(PatientSignupController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 236, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 236, 248),
        title: const Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: height,
          width: width * 0.92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Form(
                  key: patientcontroller.userSignupFormKey,
                  child: Container(
                    height: height * 0.86,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.048),
                      child: ListView(
                        children: [
                          SizedBox(height: height * 0.03),
                          Text(
                            "Sign Up as a Patient",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: width * 0.053,
                            ),
                          ),
                          Text(
                            "Create your account to access health services",
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 111, 111, 111),
                              fontSize: width * 0.035,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          CustomTextFormField(
                            isEditing: true,
                            hintText: "Name",
                            errorMessage: "Name is required",
                            controller: patientcontroller.nameController,
                            label: 'Full Name',
                          ),
                          CustomTextFormField(
                            isEditing: true,
                            hintText: "john@example.com",
                            regex:
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                            errorMessage: "Enter a valid email address",
                            controller: patientcontroller.emailController,
                            label: 'Email',
                          ),
                          CustomTextFormField(
                            isEditing: true,
                            hintText: "+92300-1234567",
                            regex: '',
                            errorMessage: "Enter a valid Phone Number",
                            controller: patientcontroller.PhoneController,
                            label: 'Phone Number',
                          ),
                          CustomDateTimePicker(
                            controller: patientcontroller.dobController,
                            label: "Date of Birth",
                          ),
                          Obx(
                            () => PasswordTextField(
                              isEditing: true,
                              controller: patientcontroller.passwordController,
                              obscureText:
                                  !patientcontroller.isPasswordVisible.value,
                              onVisibilityToggle:
                                  patientcontroller.togglePasswordVisibility,
                              label: 'Password',
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          InkWell(
                            onTap: () {
                              patientcontroller.submitForm(context);
                              Future.delayed(Duration(seconds: 3), () {
                                // Safely delete the controller after submission logic is complete.
                                Get.delete<PatientSignupController>();
                              });
                            },
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.07,
                            width: width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 120, 120, 120),
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      CustomPageTransition(
                                          page: const Loginscreen()),
                                    );
                                  },
                                  child: Text(
                                    " Log in",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 0, 123, 254),
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
