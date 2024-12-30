import 'dart:io';

import 'package:clinic_hub_app/Initialscreens/Verificationscreen/verifyemail.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/customtextfield.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/datepicker.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/imagepickerwidget.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/passwordtextfield.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/screens/Loginscreen.dart';

import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
// this is the signup screen for the user

class Usersignupscreen extends StatefulWidget {
  // final bool isDoctor;
  const Usersignupscreen({
    super.key,
  });

  @override
  State<Usersignupscreen> createState() => _UsersignupscreenState();
}

class _UsersignupscreenState extends State<Usersignupscreen> {
  var height, width;
//form key
  final _Usersignupformkey = GlobalKey<FormState>();
  //variable used to handle the visibility of the obscure text
  bool _passwordVisible = false;

  // text controllers
  final TextEditingController Namecontroller = TextEditingController();
  final TextEditingController Emailcontroller = TextEditingController();
  final TextEditingController Passwordcontroller = TextEditingController();

  final TextEditingController DOBcontroller = TextEditingController();

  @override
  // the controllers are disposed when not in use to free up the space
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Namecontroller.dispose();
    Emailcontroller.dispose();
    Passwordcontroller.dispose();

    DOBcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
              // SizedBox(
              //   height: height * 0.2,
              // ),
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                    // form
                child: Form(
                  key: _Usersignupformkey,
                  child: Container(
                    height: height * 0.86,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.048),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          SizedBox(
                            width: width * 0.8,
                            child: Text(
                              "Sign Up as a Patient",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: width * 0.053,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.00,
                          ),
                          SizedBox(
                            width: width * 0.8,
                            child: Text(
                              "Create your account to access health services",
                              style: GoogleFonts.roboto(
                                color: const Color.fromARGB(255, 111, 111, 111),
                                fontSize: width * 0.035,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          // this is a reusable widget for text inputs
                          CustomTextFormField(
                             isEditing: true,
                            hintText: "Name",
                            // regex: r"^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                            // leadingIcon: Icons.email,
                            errorMessage: "Name is required",
                            controller: Namecontroller, label: 'Full Name',
                          ),
                          CustomTextFormField(
                             isEditing: true,
                            hintText: "john@example.com",
                            regex:
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",

                            // leadingIcon: Icons.email,
                            errorMessage: "Enter a valid email address",
                            controller: Emailcontroller, label: 'Email',
                          ),
                             // this is a reusable widget for datetime inputs
                          CustomDateTimePicker(
                              controller: DOBcontroller,
                              label: "Date of Birth "),
                                 // this is a reusable widget for password inputs
                          PasswordTextField(
                            isEditing: true,
                            controller: Passwordcontroller,
                            obscureText: _passwordVisible,
                            onVisibilityToggle: _togglePasswordVisibility,
                            label: 'Password',
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                // the custom page transition is used to make the tranistion as we want
                                CustomPageTransition(
                                    page: Emailverificationscreen(
                                  ontap: () {},
                                  retryonpress: () {},
                                )),
                              );
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
                                      CustomPageTransition(page: const Loginscreen()),
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
// hides and shows the text in the password text field
  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}
