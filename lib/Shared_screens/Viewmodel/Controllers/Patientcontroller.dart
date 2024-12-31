import 'package:clinic_hub_app/Shared_screens/Resources/components/reusabeldialog.dart';
import 'package:clinic_hub_app/Shared_screens/View/Verificationscreen/verifyemail.dart';
import 'package:clinic_hub_app/Shared_screens/View/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/User_interface/Models/Usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PatientSignupController extends GetxController {
  // Form key
  final GlobalKey<FormState> userSignupFormKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();

  // Password visibility toggle
  var isPasswordVisible = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Dispose controllers when not in use
  @override
  // void onClose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   dobController.dispose();
  //   super.onClose();
  // }
  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();

    dobController.clear();
    PhoneController.clear();
  }

  void submitForm(BuildContext context) async {
    if (userSignupFormKey.currentState?.validate() ?? false) {
      try {
        UserCredential userCredential = await _registerUser();
        await _sendEmailVerification(userCredential, context);
        await _waitForEmailVerification(userCredential.user);
        await _storeDoctorData(createPatientmodel());
        _navigateToVerificationScreen(context);
        clearForm();
      } on FirebaseAuthException catch (e) {
        _handleAuthException(e, context);
      }
    }
  }

// register the user on firebase
  Future<UserCredential> _registerUser() async {
    return await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  // Helper function to send email verification
  Future<void> _sendEmailVerification(
      UserCredential userCredential, BuildContext context) async {
    await userCredential.user?.sendEmailVerification();
    ReusableDialog.show(
      context,
      title: "Email Verification",
      content: "Please verify your email before proceeding.",
      buttonText: "OK",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Emailverificationscreen(
              ontap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Loginscreen(),
                  ),
                );
              },
              retryonpress: () async {
                await userCredential.user?.sendEmailVerification();
              },
            ),
          ),
        );
      },
    );
  }

  // Helper function to wait for email verification
  Future<void> _waitForEmailVerification(User? user) async {
    while (user != null && !user.emailVerified) {
      await user.reload();
      user = _auth.currentUser;
      await Future.delayed(Duration(seconds: 3));
    }
  }

  // Helper function to handle FirebaseAuthException
  void _handleAuthException(FirebaseAuthException e, BuildContext context) {
    String message;
    switch (e.code) {
      case 'email-already-in-use':
        message = "The email address is already in use by another account.";
        break;
      case 'weak-password':
        message =
            "The password is too weak. Please choose a stronger password.";
        break;
      case 'invalid-email':
        message = "The email address is not valid. Please enter a valid email.";
        break;
      default:
        message = "An error occurred: ${e.message}";
    }
    ReusableDialog.show(
      context,
      title: "Sign-Up Failed",
      content: message,
      buttonText: "OK",
    );
  }

  // Helper function to create Doctor model
  Patient_model createPatientmodel() {
    var id = Uuid();
    var patientid = id.v4();
    return Patient_model(
        PatientId: patientid,
        Patientname: nameController.text,
        Patientdob: dobController.text,
        PatientEmail: emailController.text,
        Patientpassword: passwordController.text,
        Patientphonenumber: PhoneController.text,
        Patientprofilepicture: '');
  }

  // Helper function to store doctor data in Firestore
  Future<void> _storeDoctorData(Patient_model doctor) async {
    try {
      await _firestore.collection('Patients').doc().set({
        'PatientId': doctor.PatientId,
        'Patientname': doctor.Patientname,
        'Patientdob': doctor.Patientdob,
        'PatientEmail': doctor.PatientEmail,
        'Patientpassword': doctor.Patientpassword,
        'Patientphonenumber': doctor.Patientphonenumber,
        'Patientprofilepicture': doctor.Patientprofilepicture,
      });
    } catch (e) {
      print("Error storing doctor data: $e");
    }
  }

  // Helper function to navigate to verification screen
  void _navigateToVerificationScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Emailverificationscreen(
          ontap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Loginscreen()));
          },
          retryonpress: () {
              print("Retry button pressed");
          },
        ),
      ),
    );
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
