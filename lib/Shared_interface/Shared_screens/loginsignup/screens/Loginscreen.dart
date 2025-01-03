import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/Doctorhomescreen.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/pageviewdoctor.dart';
import 'package:clinic_hub_app/Doctor_interface/doctor_viewmodel/Controllers/Doctorlofincontroller.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_ViewModel/Controllers/patientlogincontroller.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/forgotpasswordscreen.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/customtextfield.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/passwordtextfield.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/selectionscreen.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Patientsignupscreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/Homescreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/pageview.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//Both doctor and the patient have the same screen for login having
// tabbar for both to see thier options seperately

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // Key to manage the Form
  final GlobalKey<FormState> _loginformKeypatient = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginformKeydoctor = GlobalKey<FormState>();
  //textfield controllers
  final TextEditingController docEmailcontroller = TextEditingController();
  final TextEditingController docPasswordcontroller = TextEditingController();
  final TextEditingController PEmailcontroller = TextEditingController();
  final TextEditingController PPasswordcontroller = TextEditingController();
  bool _passwordVisible = false;
  late Patientlogincontroller patient_logincontroller;
  late Doctorlogincontroller doctor_logincontroller;

  var height, width;

  @override
  void initState() {
    patient_logincontroller = Get.put(Patientlogincontroller());
    doctor_logincontroller = Get.put(Doctorlogincontroller());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    docEmailcontroller.clear();
    docPasswordcontroller.clear();
    PEmailcontroller.clear();
    PPasswordcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 203, 236, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 236, 248),
        title: const Text(
          "Login",
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Center(
          child: Container(
            height: height,
            width: width * 0.92,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: height * 0.7,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.048),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          TabBar(
                            tabs: const [
                              Tab(
                                text: "Doctor",
                              ),
                              Tab(text: "Patient"),
                            ],
                            labelStyle: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: width * 0.044,
                                fontWeight: FontWeight.bold),
                            indicatorColor: Colors.blue,
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Form(
                                  key: _loginformKeydoctor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                        CustomTextFormField(
                                          isEditing: true,
                                          hintText: "john@example.com",
                                          regex:
                                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                                          errorMessage:
                                              "Enter a valid email address",
                                          controller: docEmailcontroller,
                                          label: 'Email',
                                        ),
                                        PasswordTextField(
                                          isEditing: true,
                                          controller: docPasswordcontroller,
                                          obscureText: _passwordVisible,
                                          onVisibilityToggle:
                                              _togglePasswordVisibility,
                                          label: 'Password',
                                        ),
                                        SizedBox(
                                          height: height * 0.004,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              CustomPageTransition(
                                                  page: const forgetpassword()),
                                            );
                                          },
                                          child: Text(
                                            "Forgot password?",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Obx(() {
                                          return InkWell(
                                            onTap: () {
                                              if (_loginformKeydoctor
                                                      .currentState
                                                      ?.validate() ??
                                                  false) {
                                                // Validation passed, proceed to submission logic
                                                if (!doctor_logincontroller
                                                    .isloading.value) {
                                                  // Only trigger the form submission if not already loading
                                                  doctor_logincontroller
                                                      .loginUser(
                                                    docEmailcontroller.text,
                                                    docPasswordcontroller.text,
                                                    context,
                                                  );
                                                }
                                              } else {
                                                // Validation failed, you can show a message if necessary
                                                print("Form validation failed");
                                              }
                                            },
                                            child: Container(
                                              height: height * 0.06,
                                              width: width * 0.8,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: doctor_logincontroller
                                                        .isloading.value
                                                    ? const CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Colors.white),
                                                      )
                                                    : Text(
                                                        "Login",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              width * 0.04,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          );
                                        }),
                                        SizedBox(
                                          height: height * 0.07,
                                          width: width * 0.8,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Don't have an account?",
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
                                                        page:
                                                            const Selectionscreen()),
                                                  );
                                                },
                                                child: Text(
                                                  " Sign Up",
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 123, 254),
                                                      fontSize: width * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _loginformKeypatient,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                        CustomTextFormField(
                                          isEditing: true,
                                          hintText: "john@example.com",
                                          regex:
                                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                                          errorMessage:
                                              "Enter a valid email address",
                                          controller: PEmailcontroller,
                                          label: 'Email',
                                        ),
                                        PasswordTextField(
                                          isEditing: true,
                                          controller: PPasswordcontroller,
                                          obscureText: _passwordVisible,
                                          onVisibilityToggle:
                                              _togglePasswordVisibility,
                                          label: 'Password',
                                        ),
                                        SizedBox(
                                          height: height * 0.004,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              CustomPageTransition(
                                                  page: const forgetpassword()),
                                            );
                                          },
                                          child: Text(
                                            "Forgot password?",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Obx(() {
                                          return InkWell(
                                            onTap: () {
                                              if (_loginformKeypatient
                                                      .currentState
                                                      ?.validate() ??
                                                  false) {
                                                // Validation passed, proceed to submission logic
                                                if (!patient_logincontroller
                                                    .isloading.value) {
                                                  // Only trigger the form submission if not already loading
                                                  patient_logincontroller
                                                      .loginUser(
                                                    PEmailcontroller.text,
                                                    PPasswordcontroller.text,
                                                    context,
                                                  );
                                                }
                                              } else {
                                                // Validation failed, you can show a message if necessary
                                                print("Form validation failed");
                                              }
                                            },
                                            child: Container(
                                              height: height * 0.06,
                                              width: width * 0.8,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: patient_logincontroller
                                                        .isloading.value
                                                    ? const CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Colors.white),
                                                      )
                                                    : Text(
                                                        "Login",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              width * 0.04,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          );
                                        }),
                                        SizedBox(
                                          height: height * 0.07,
                                          width: width * 0.8,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Don't have an account?",
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 120, 120, 120),
                                                    fontSize: width * 0.04),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    CustomPageTransition(
                                                        page:
                                                            const Selectionscreen()),
                                                  );
                                                },
                                                child: Text(
                                                  " Sign Up",
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 123, 254),
                                                      fontSize: width * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}
