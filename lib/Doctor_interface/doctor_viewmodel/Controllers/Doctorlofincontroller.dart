import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Doctor_model.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/pageviewdoctor.dart';

import 'package:clinic_hub_app/Patient_interface/Patient_screens/Homescreen.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class Doctorlogincontroller extends GetxController {
  var isloading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late FirebaseMessaging messaging;

  // Function to log in the user
  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    email = email.trim();
    password = password.trim();
    print('email is $email');
    print('password is $password');

    try {
      print('Fetching document...');
      QuerySnapshot query = await _firestore
          .collection('doctors')
          .where("Doctoremail", isEqualTo: email)
          .where("password", isEqualTo: password)
          .get();
      print('Query result: ${query.docs}');

      if (query.docs.isEmpty) {
        _Incorrectpopup(context);
      } else {
        print('Mapping document to Doctor_Model...');
        Doctor_Model model =
            Doctor_Model.fromMap(query.docs[0].data() as Map<String, dynamic>);
        print('Doctor Model: $model');

        StaticDoctor.doctormodel = model;
        //saveLoginDataToSF(model.doctorid !, 'doctor');

        await Navigator.of(context)
            .push(CustomPageTransition(page: const Doctor_panel_pageview()));
      }
    } catch (e) {
      print('Error during login: $e');
      if (e is SocketException) {
        print('No internet connection');
      } else if (e is FirebaseAuthException) {
        print('FirebaseAuth error: ${e.message}');
      } else {
        print('Unexpected error: $e');
      }
    } finally {
      isloading = false.obs;
    }
  }

// fucnction to save userid
  saveLoginDataToSF(String id, String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', id);
    prefs.setString('usertype', user);
  }

  // Function to get and update the device token
  // Future<void> getToken(String userId) async {
  //   messaging = FirebaseMessaging.instance;
  //   try {
  //     String? token = await messaging.getToken();
  //     if (token != null) {
  //       // Save token in StaticDoctor.token
  //       StaticDoctor.docdevicetoken = token;

  //       // Update the device token in Firestore under the user's document
  //       await _firestore.collection('doctors').doc(userId).update({
  //         'docdevicetoken': token,
  //       });

  //       print("Token updated in Firestore: $token");
  //     }
  //   } catch (e) {
  //     print('Error retrieving or updating token: $e');
  //   }
  // }

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
