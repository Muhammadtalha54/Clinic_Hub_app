import 'package:clinic_hub_app/Patient_interface/Patient_models/Staticmodel.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_models/Usermodel.dart'; // Import the Patient_model class
import 'package:clinic_hub_app/Patient_interface/Patient_screens/Homescreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/pageview.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class Patientlogincontroller extends GetxController {
  var isloading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late FirebaseMessaging messaging;

  // Function to log in the user
  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    email = email.trim().toLowerCase();
    password = password;
    print(email);
    print('this is the password$password');

    try {
      isloading = true.obs;
      // Query Firestore to find user matching email and password
      QuerySnapshot query = await _firestore
          .collection('Patients')
          .where("PatientEmail", isEqualTo: email)
          .where("Patientpassword", isEqualTo: password)
          .get();

      print('Query Result: ${query.docs.length}');

      if (query.docs.isEmpty) {
        print('No matching documents found');
        // Show popup if no matching document is found
        _Incorrectpopup(context);
      } else {
        // Create the model by mapping Firestore data to the Patient_model
        Patient_model model =
            Patient_model.fromMap(query.docs[0].data() as Map<String, dynamic>);
        print(model.PatientId);
        // Assign the fetched data to StaticPatient.patient_model
        StaticPatient.patient_model = model;
        saveLoginDataToSF(model.PatientId!, 'patient');
        isloading = false.obs;

        // Update token for the logged-in user
        //await getToken(query.docs[0].id);

        await Navigator.of(context)
            .push(CustomPageTransition(page: const Patient_panel_pageview()));

        // Optional: Navigate or update UI
        print('User logged in: ${StaticPatient.patient_model?.Patientname}');
      }
    } catch (e) {
      if (e is SocketException) {
        print('No internet connection');
      } else if (e is FirebaseAuthException) {
        print('Error: ${e.message}');
      } else {
        print('Unexpected error: $e');
      }
    }
  }

// fucnction to save userid
  saveLoginDataToSF(String id, String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', id);
    prefs.setString('usertype', user);
  }

  //Function to get and update the device token
  Future<void> getToken(String userId) async {
    messaging = FirebaseMessaging.instance;
    try {
      String? token = await messaging.getToken();
      if (token != null) {
        // Save token in StaticPatient.token
        StaticPatient.token = token;

        // Update the device token in Firestore under the user's document
        await _firestore.collection('Patients').doc(userId).update({
          'Pdevicetoken': token,
        });

        print("Token updated in Firestore: $token");
      }
    } catch (e) {
      print('Error retrieving or updating token: $e');
    }
  }

  // Popup for incorrect login details
  void _Incorrectpopup(BuildContext context) {
    // Display the popup if credentials are incorrect
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content:
              const Text('The email or password you entered is incorrect.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to check login status
  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  // Function to log out the user
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogin', false);
      print('User logged out');
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
