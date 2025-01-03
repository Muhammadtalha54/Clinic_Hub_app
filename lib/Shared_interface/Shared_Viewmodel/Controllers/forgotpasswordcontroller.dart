import 'dart:io';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  // TextEditingController for the email field
  final TextEditingController emailController = TextEditingController();

  // Observable for tracking loading state
  var isLoading = false.obs;

  // Function to send a reset email
  Future<void> sendResetEmail(BuildContext context) async {
    final String email = emailController.text.trim();

    // Validation: Ensure email is not empty
    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email.",
          snackPosition: SnackPosition.TOP);
      return;
    }

    // Set loading state
    isLoading.value = true;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('sent');
      Get.snackbar("Success", "Password reset email sent.",
          snackPosition: SnackPosition.BOTTOM);

      Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const Loginscreen(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showReusableDialog(
            context, "Error", "No user found with this email.");
      } else {
        showReusableDialog(
            context, "Error", "An error occurred: ${e.message}");
      }
    } on SocketException {
      showReusableDialog(
          context, "Error", "No internet connection. Please try again.");
    } catch (e) {
      showReusableDialog(
          context, "Error", "An unexpected error occurred.");
    } finally {
      // Reset loading state
      isLoading.value = false;
    }
  }

  // Function to show a reusable dialog
  void showReusableDialog(BuildContext context, String title, String message) {
    ReusableDialog.show(
      context,
      title: "Sign-Up Failed",
      content: message,
      buttonText: "OK",
    );
  }

  // Dispose the controller when it's no longer needed
  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
