import 'dart:convert';
import 'dart:io';

import 'package:clinic_hub_app/Patient_interface/Patient_models/Staticmodel.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ProfileUpdateController extends GetxController {
  // Controllers for text fields as reactive state variables
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString password = ''.obs;

  // Reactive variable to handle image and loading state
  final ImagePicker _picker = ImagePicker();
  RxString selectedprofileimageurl = ''.obs;
  RxBool isloading = false.obs;

  // Function to show a confirmation dialog
  Future<bool?> showConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Update"),
          content: const Text("Are you sure you want to update your profile?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                // Call the updateProfile function here
                await updateProfile(context);

                // Close the dialog after the profile is updated
                Navigator.of(context).pop(true);
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  // Function to update the profile in Firestore
  Future<void> updateProfile(BuildContext context) async {
    String patientId = StaticPatient.patient_model!.PatientId!;

    try {
      // Set the loading state to true while updating
      isloading.value = true;

      // Perform the Firestore update
      await FirebaseFirestore.instance
          .collection('Patients')
          .doc(patientId)
          .update({
        'Patientname': name.value,
        'Patientprofilepicture': selectedprofileimageurl.value,
        'Patientphonenumber': phone.value,
        'Patientpassword': password.value,
      });

      // Update the static patient model
      StaticPatient.patient_model!.Patientname = name.value;
      StaticPatient.patient_model!.Patientprofilepicture =
          selectedprofileimageurl.value;
      StaticPatient.patient_model!.Patientphonenumber = phone.value;
      StaticPatient.patient_model!.Patientpassword = password.value;

      // Show success message
      _showMessage(context, 'Profile updated successfully!', Colors.green);
    } catch (e) {
      // Handle any errors during update
      _showMessage(context, 'Error updating profile: $e', Colors.red);
    } finally {
      // Set the loading state back to false after the operation completes
      isloading.value = false;
    }
  }

  // Helper function to show a message
  void _showMessage(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Function to pick and upload image
  Future<void> pickImage(String imageType) async {
    try {
      // Show image picker and allow user to pick an image from gallery
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Clear previously selected image URL
        selectedprofileimageurl.value = '';
        await uploadImageToImgur(pickedFile, 'profile');

        // Set loading state to true when the upload starts
        isloading.value = true;

        // Upload the picked image to Imgur
      }
    } catch (e) {
      // Handle errors (e.g., user cancelling the image picker or other issues)
      ReusableDialog.show(Get.context!,
          title: "Error",
          content: "The file image was not selected. Please try again.",
          buttonText: "OK");
    }
  }

  // Method to upload the selected image to Imgur
  Future<void> uploadImageToImgur(XFile image, String imageType) async {
    try {
      const String clientId = '63359fda20ba02f'; // Your Imgur client ID
      final bytes = await image.readAsBytes();
      final uri = Uri.parse('https://api.imgur.com/3/upload');
      final headers = {'Authorization': 'Client-ID $clientId'};
      final body = {'image': base64Encode(bytes), 'type': 'base64'};

      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers)
        ..fields['hidden'] = 'true'
        ..files.add(http.MultipartFile.fromBytes('image', bytes,
            filename: 'image.jpg'));

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(responseData.body);
        final String imageUrl = json['data']['link'];

        // Once uploaded, update the selected image URL with the Imgur link
        selectedprofileimageurl.value = imageUrl;

        // Set loading to false after image is uploaded
        isloading.value = false;
      } else {
        // Handle error response from Imgur
        print('Error uploading image: ${response.statusCode}');
        ReusableDialog.show(
          Get.context!,
          title: "Error Uploading Image",
          content: "Failed to upload image. Please try again.",
          buttonText: "OK",
        );
        isloading.value = false;
      }
    } on SocketException catch (_) {
      // Handle network-related errors
      ReusableDialog.show(
        Get.context!,
        title: "Network Error",
        content: "Please check your internet connection and try again.",
        buttonText: "OK",
      );
      isloading.value = false;
    } catch (e) {
      // General error handling
      ReusableDialog.show(
        Get.context!,
        title: "Error Uploading Image",
        content: "Image was not uploaded. Please try again.",
        buttonText: "OK",
      );
      isloading.value = false;
    }
  }
}
