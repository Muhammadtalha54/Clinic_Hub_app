// import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
// import 'package:clinic_hub_app/Shared_interface/Shared_Utils/Utils.dart';

// import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
// import 'package:clinic_hub_app/Patient_interface/Patient_models/Usermodel.dart';
// import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/verifyemail.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uuid/uuid.dart';

// // this controller is for the patient signup functionality
// class PatientSignupController extends GetxController {
// // variable for the isloading
//   var isLoading = false.obs;
//   // Form key
//   final GlobalKey<FormState> userSignupFormKey = GlobalKey<FormState>();

//   // Text controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController PhoneController = TextEditingController();

//   // Password visibility toggle
//   var isPasswordVisible = false.obs;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Dispose controllers when not in use
//   @override
//   // void onClose() {
//   //   nameController.dispose();
//   //   emailController.dispose();
//   //   passwordController.dispose();
//   //   dobController.dispose();
//   //   super.onClose();
//   // }
//   void clearForm() {
//     nameController.clear();
//     emailController.clear();
//     passwordController.clear();

//     dobController.clear();
//     PhoneController.clear();
//   }

//   void submitForm(BuildContext context) async {
//     if (userSignupFormKey.currentState?.validate() ?? false) {
//       isLoading.value = true;
//       try {
//         UserCredential userCredential = await _registerUser();
//         await _sendEmailVerification(userCredential, context);
//         await _waitForEmailVerification(userCredential.user);
//         await _storeDoctorData(createPatientmodel());
//         _navigateToVerificationScreen(context);
//         clearForm();
//       } on FirebaseAuthException catch (e) {
//         _handleAuthException(e, context);
//       } finally {
//         isLoading.value = false; // Stop loading after process is complete
//       }
//     }
//   }

// // register the user on firebase
//   Future<UserCredential> _registerUser() async {
//     try {
//       return await _auth.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//     } catch (e) {
//       return await Utils.snackbar('Registration Error',
//           'An error occurred during registration. Please try again.');
//       //  return Utils.snackbar('Verification Error'.tr, 'Verification request could not be sent'.tr);
//     }
//   }

//   // Helper function to send email verification
//   Future<void> _sendEmailVerification(
//       UserCredential userCredential, BuildContext context) async {
//     await userCredential.user?.sendEmailVerification();
//     ReusableDialog.show(
//       context,
//       title: "Email Verification",
//       content: "Please verify your email before proceeding.",
//       buttonText: "OK",
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Emailverificationscreen(
//               ontap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const Loginscreen(),
//                   ),
//                 );
//               },
//               retryonpress: () async {
//                 await userCredential.user?.sendEmailVerification();
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Helper function to wait for email verification
//   Future<void> _waitForEmailVerification(User? user) async {
//     while (user != null && !user.emailVerified) {
//       await user.reload();
//       user = _auth.currentUser;
//       await Future.delayed(const Duration(seconds: 3));
//     }
//   }

//   // Helper function to handle FirebaseAuthException
//   void _handleAuthException(FirebaseAuthException e, BuildContext context) {
//     String message;
//     switch (e.code) {
//       case 'email-already-in-use':
//         message = "The email address is already in use by another account.";
//         break;
//       case 'weak-password':
//         message =
//             "The password is too weak. Please choose a stronger password.";
//         break;
//       case 'invalid-email':
//         message = "The email address is not valid. Please enter a valid email.";
//         break;
//       default:
//         message = "An error occurred: ${e.message}";
//     }
//     ReusableDialog.show(
//       context,
//       title: "Sign-Up Failed",
//       content: message,
//       buttonText: "OK",
//     );
//   }

//   // Helper function to create Doctor model
//   Patient_model createPatientmodel() {
//     var id = const Uuid();
//     var patientid = id.v4();
//     return Patient_model(
//         PatientId: patientid,
//         Patientname: nameController.text,
//         Patientdob: dobController.text,
//         PatientEmail: emailController.text,
//         Patientpassword: passwordController.text,
//         Patientphonenumber: PhoneController.text,
//         Patientprofilepicture: '',
//         Pdevicetoken: '');
//   }

//   // Helper function to store doctor data in Firestore
//   Future<void> _storeDoctorData(Patient_model doctor) async {
//     try {
//       await _firestore.collection('Patients').doc().set({
//         'PatientId': doctor.PatientId,
//         'Patientname': doctor.Patientname,
//         'Patientdob': doctor.Patientdob,
//         'PatientEmail': doctor.PatientEmail,
//         'Patientpassword': doctor.Patientpassword,
//         'Patientphonenumber': doctor.Patientphonenumber,
//         'Patientprofilepicture': doctor.Patientprofilepicture,
//         'Pdevicetoken': doctor.Pdevicetoken,
//       });
//     } catch (e) {
//       print("Error storing doctor data: $e");
//     }
//   }

//   // Helper function to navigate to verification screen
//   void _navigateToVerificationScreen(BuildContext context) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Emailverificationscreen(
//           ontap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Loginscreen()));
//           },
//           retryonpress: () {
//             print("Retry button pressed");
//           },
//         ),
//       ),
//     );
//   }

//   // Method to toggle password visibility
//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }
// }

import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_Utils/Utils.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_models/Usermodel.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

// This controller is for the patient signup functionality
class PatientSignupController extends GetxController {
  // Variable for the isloading
  var isLoading = false.obs;

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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Dispose controllers when not in use
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dobController.dispose();
    PhoneController.dispose();
    super.onClose();
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    dobController.clear();
    PhoneController.clear();
  }

  void submitForm(BuildContext context) async {
    if (userSignupFormKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      // Check if the email already exists
      bool emailExists = await checkIfEmailExists(emailController.text);
      if (emailExists) {
        isLoading.value = false; // Stop loading after checking email
        _showEmailExistsDialog(context); // Show the email exists dialog
      } else {
        try {
          await _storePatientData(createPatientModel());
          clearForm();
          _showSuccessDialog(context);
        } catch (e, stackTrace) {
          _handleError(e.toString(), context);
        } finally {
          isLoading.value = false; // Stop loading after process is complete
        }
      }
    }
  }

  // Helper function to create Patient model
  Patient_model createPatientModel() {
    var id = const Uuid();
    var patientId = id.v4();
    return Patient_model(
      PatientId: patientId,
      Patientname: nameController.text,
      Patientdob: dobController.text,
      PatientEmail: emailController.text,
      Patientpassword: passwordController.text,
      Patientphonenumber: PhoneController.text,
      Patientprofilepicture: '',
      Pdevicetoken: '',
    );
  }

  // Helper function to store patient data in Firestore
  Future<void> _storePatientData(Patient_model patient) async {
    try {
      await _firestore.collection('Patients').doc(patient.PatientId).set({
        'PatientId': patient.PatientId,
        'Patientname': patient.Patientname,
        'Patientdob': patient.Patientdob,
        'PatientEmail': patient.PatientEmail,
        'Patientpassword': patient.Patientpassword,
        'Patientphonenumber': patient.Patientphonenumber,
        'Patientprofilepicture': patient.Patientprofilepicture,
        'Pdevicetoken': patient.Pdevicetoken,
      });
    } catch (e) {
      throw Exception("Error storing patient data: $e");
    }
  }

  // Helper function to handle errors
  void _handleError(String message, BuildContext context) {
    ReusableDialog.show(
      context,
      title: "Sign-Up Failed",
      content: message,
      buttonText: "OK",
    );
  }

  // Show success dialog after successful data storage
  void _showSuccessDialog(BuildContext context) {
    ReusableDialog.show(
      context,
      title: "Registration Successful",
      content: "Patient registration was successful.",
      buttonText: "OK",
      onPressed: () {
        // Navigate to the login screen or other actions
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Loginscreen()),
        );
      },
    );
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Function to check if email exists in Firestore
  Future<bool> checkIfEmailExists(String email) async {
    try {
      QuerySnapshot query = await _firestore
          .collection('Patients')
          .where("PatientEmail", isEqualTo: email)
          .get();
      return query.docs.isNotEmpty; // If email already exists, return true
    } catch (e) {
      print("Error checking email existence: $e");
      return false;
    }
  }

  // Show dialog when the email already exists
  void _showEmailExistsDialog(BuildContext context) {
    ReusableDialog.show(
      context,
      title: "Email Already Exists",
      content: "The email you have entered is already associated with an existing account.",
      buttonText: "OK",
    );
  }
}
