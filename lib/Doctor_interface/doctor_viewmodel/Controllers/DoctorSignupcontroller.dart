import 'dart:convert';
import 'dart:io';

import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Doctor_model.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_Utils/Utils.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';

import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/verifyemail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
// controller for the doctor signup functionality
class DoctorSignupController extends GetxController {
  // Form Key
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Text Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lisenceController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Reactive variables
  RxString? selectedlisenceimageurl = ''.obs;
  RxString? selectedprofileimageurl = ''.obs;
  RxBool passwordVisible = true.obs;
  RxString selectedCategory = 'General Physician'.obs;
  RxString selectedGender = ''.obs;
  RxBool isloading = false.obs;

  // Doctor categories
  final List<RxString> doctorCategories = [
    "General Physician".obs,
    "Cardiologist".obs,
    "Dermatologist".obs,
    "Neurologist".obs,
    "Orthopedic".obs,
    "Pediatrician".obs,
    "Psychiatrist".obs,
    "Gynecologist".obs,
    "Dentist".obs,
    "ENT Specialist".obs,
  ];

  @override
 
  // Method to clear all controllers and variables
  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    lisenceController.clear();
    dobController.clear();
    experienceController.clear();
    descriptionController.clear();
    selectedlisenceimageurl!.value = '';
    selectedprofileimageurl!.value = '';
    selectedCategory.value = 'General Physician';
    selectedGender.value = '';
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  // Method to update gender
  void updateGender(String gender) {
    selectedGender.value = gender;
  }

  // Method to submit the form
  void submitForm(BuildContext context) async {
    if (signupFormKey.currentState?.validate() ?? false) {
      try {
        UserCredential userCredential = await _registerUser();
        await _sendEmailVerification(userCredential, context);
        await _waitForEmailVerification(userCredential.user);
        await _storeDoctorData(createDoctorModel());
        _navigateToVerificationScreen(context);
        clearForm();
      } on FirebaseAuthException catch (e) {
        _handleAuthException(e, context);
      }
    }
  }

  // Helper function to register user
  Future<UserCredential> _registerUser() async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      return Utils.snackbar(
          'Verification Error'.tr, 'Verification request could not be sent'.tr);
    }
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
  Doctor_Model createDoctorModel() {
    var id = Uuid();
    var doctorid = id.v4();
    return Doctor_Model(
      doctorid: doctorid,
      doctorname: nameController.text,
      Doctoremail: emailController.text,
      password: passwordController.text,
      doctorlisencenumber: lisenceController.text,
      doctorDOB: dobController.text,
      doctorexperience: experienceController.text,
      doctordescription: descriptionController.text,
      doctorspecialization: selectedCategory.value,
      doctorgender: selectedGender.value,
      doctorimageurl: selectedprofileimageurl!.value,
      doctorlisenceimageurl: selectedlisenceimageurl!.value,
    );
  }

  // Helper function to store doctor data in Firestore
  Future<void> _storeDoctorData(Doctor_Model doctor) async {
    try {
      await _firestore.collection('doctors').doc().set({
        'docotrid': doctor.doctorid,
        'doctorname': doctor.doctorname,
        'Doctoremail': doctor.Doctoremail,
        'password': doctor.password,
        'doctorlisencenumber': doctor.doctorlisencenumber,
        'doctorDOB': doctor.doctorDOB,
        'doctorexperience': doctor.doctorexperience,
        'doctordescription': doctor.doctordescription,
        'doctorspecialization': doctor.doctorspecialization,
        'doctorgender': doctor.doctorgender,
        'doctorimageurl': doctor.doctorimageurl,
        'doctorlisenceimageurl': doctor.doctorlisenceimageurl,
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
            print("Retry button pressed");
          },
          retryonpress: () {
            print("Retry button pressed");
          },
        ),
      ),
    );
  }

  // Method to pick image from gallery
  Future<void> pickImage(String imageType) async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (imageType == 'profile') {
          selectedprofileimageurl!.value = '';
          isloading = true.obs;
          print('this is the picked image$pickedFile');
          await uploadImageToImgur(pickedFile, 'profile');
        } else if (imageType == 'license') {
          print('this is the picked image$pickedFile');
          selectedlisenceimageurl!.value = '';
          isloading = true.obs;
          await uploadImageToImgur(pickedFile, 'license');
        }
      }
    } catch (e) {
      Utils.snackbar('Try again', 'The File image was not selected');
      //  print('Error picking image: $e');
    }
  }

  // Function to upload an image to Imgur and get the URL
  Future<void> uploadImageToImgur(
    XFile image,
    String imageType,
  ) async {
    try {
      final String clientId = '63359fda20ba02f';
      final bytes = await image.readAsBytes();
      final uri = Uri.parse('https://api.imgur.com/3/upload');
      final headers = {'Authorization': 'Client-ID $clientId'};
      final body = {'image': base64Encode(bytes), 'type': 'base64'};

      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers)
        //..fields['hidden'] = 'true'
        ..fields['hidden'] = 'true'
        ..files.add(http.MultipartFile.fromBytes('image', bytes,
            filename: 'image.jpg'));

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(responseData.body);
        final String imageUrl = json['data']['link'];
        if (imageType == 'profile') {
          selectedprofileimageurl!.value = imageUrl;
          isloading = false.obs;
        } else if (imageType == 'license') {
          selectedlisenceimageurl!.value = imageUrl;
          isloading = false.obs;
        }
      } else {
        print('Error uploading image: ${response.statusCode}');
      }
    } catch (e) {
      Utils.snackbar('Error Uloading image',
          'image was not uploaded to the cloud storage try again');
    }
  }
}
