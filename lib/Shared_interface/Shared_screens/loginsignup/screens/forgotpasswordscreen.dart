import 'dart:ffi';

import 'package:clinic_hub_app/Shared_interface/Shared_Viewmodel/Controllers/forgotpasswordcontroller.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Newpasswordscreen.dart';

import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/customtextfield.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/verifyemail.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*This is the screen that the user will access when he/she will forgot
 the passcode this will be the used for both the  user and the doctor 
 the patient/doctor will enter thier email and then a code will be sent on
 their email to verify thier email address by adding the code on the next screen

*/

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  final _formKey = GlobalKey<FormState>();
  late ForgetPasswordController forgetPasswordController;
  // TextEditingController emailcontroller = TextEditingController();

  @override
  initState() {
    super.initState();
    forgetPasswordController = Get.put(ForgetPasswordController());
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();

    Get.delete<ForgetPasswordController>();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: height,
            width: width,
            //  color: Color.fromRGBO(248, 248, 248, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height! * 0.05,
                  width: width! * 0.9,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Apptheme.mainbackgroundcolor,
                            size: width! * 0.06,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.3,
                  width: width * 0.45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/coloredlogo.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: height! * 0.07,
                ),
                Text(
                  "Forgot password ",
                  style: TextStyle(
                      color: Apptheme.mainbackgroundcolor,
                      fontSize: width! * 0.045,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height! * 0.035,
                ),
                Text(
                  "Enter email address to receive a\n    reset password email",
                  style: TextStyle(
                    color: const Color.fromRGBO(34, 34, 34, 0.5),
                    fontSize: width! * 0.04,
                  ),
                ),
                SizedBox(
                  height: height! * 0.018,
                ),
                CustomTextFormField(
                  isEditing: true,
                  hintText: "john@example.com",
                  regex: r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",

                  // leadingIcon: Icons.email,
                  errorMessage: "Enter a valid email address",
                  controller: forgetPasswordController.emailController,
                  label: '',
                ),
                SizedBox(
                  height: height! * 0.03,
                ),
                Obx(
                  () => Card(
                    elevation: 5,
                    shadowColor: const Color.fromARGB(255, 170, 168, 168),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // Only proceed if the form is valid
                          if (!forgetPasswordController.isLoading.value) {
                            // Set loading state to true
                            forgetPasswordController.isLoading.value = true;

                            // Send reset email
                            await forgetPasswordController
                                .sendResetEmail(context);

                            // After the email is sent, set loading back to false
                            forgetPasswordController.isLoading.value = false;
                          }
                        }
                      },
                      child: Container(
                        height: height! * 0.066,
                        width: width! * 0.86,
                        decoration: BoxDecoration(
                          color: Apptheme.mainbackgroundcolor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: forgetPasswordController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontSize: width! * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
