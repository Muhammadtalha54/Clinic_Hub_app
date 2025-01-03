import 'dart:convert';
import 'dart:io';

import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Doctor_model.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Schedule_model.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_Utils/Utils.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class DoctorSignupController extends GetxController {
  var isLoading = false.obs;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lisenceController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxString? selectedlisenceimageurl = ''.obs;
  RxString? selectedprofileimageurl = ''.obs;
  RxBool passwordVisible = true.obs;
  RxString selectedCategory = 'General Physician'.obs;
  RxString selectedGender = ''.obs;
  RxBool isloading = false.obs;

  final List<RxString> doctorCategories = [
    "General Physician".obs,
    "Cardiologist".obs,
    "Dermatologist".obs,
    "Neurologist".obs,
    "Orthopedic".obs,
    "Gynecologist".obs,
    "Dentist".obs,
  ];

  @override
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

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void updateGender(String gender) {
    selectedGender.value = gender;
  }

  void submitForm(BuildContext context) async {
    if (signupFormKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      try {
        // Check if the email already exists in the 'doctors' collection
        bool emailExists = await checkIfEmailExists(emailController.text);

        if (emailExists) {
          // Show dialog if email already exists
          ReusableDialog.show(
            context,
            title: "Sign-Up Failed",
            content: "Account Already Exists",
            buttonText: "OK",
          );
        } else {
          // Proceed with storing doctor data if email does not exist
          await _storeDoctorData(createDoctorModel());
          _navigateToVerificationScreen(context);
          clearForm();
        }
      } on FirebaseException catch (e) {
        _handleAuthException(e, context);
      } finally {
        isLoading.value = false;
      }
    }
  }

  void _handleAuthException(FirebaseException e, BuildContext context) {
    String message = e.message ?? "An error occurred while signing up.";
    ReusableDialog.show(
      context,
      title: "Sign-Up Failed",
      content: message,
      buttonText: "OK",
    );
  }

  Doctor_Model createDoctorModel() {
    var id = const Uuid();
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
      docdevicetoken: '',
    );
  }

  Future<void> _storeDoctorData(Doctor_Model doctor) async {
    try {
      await _firestore.collection('doctors').doc(doctor.doctorid).set({
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
        'docdevicetoken': '',
      });
    } catch (e) {
      print("Error storing doctor data: $e");
      ReusableDialog.show(
        Get.context!,
        title: "Data Storage Error",
        content: "Error occurred while storing doctor data: $e",
        buttonText: "OK",
      );
    }
  }

  void _navigateToVerificationScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Loginscreen(),
      ),
    );
  }

  Future<void> pickImage(String imageType) async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (imageType == 'profile') {
          selectedprofileimageurl!.value = '';
          isloading = true.obs;
          await uploadImageToImgur(pickedFile, 'profile');
        } else if (imageType == 'license') {
          selectedlisenceimageurl!.value = '';
          isloading = true.obs;
          await uploadImageToImgur(pickedFile, 'license');
        }
      }
    } catch (e) {
      ReusableDialog.show(Get.context!,
          title: "Error",
          content: "The file image was not selected. Please try again.",
          buttonText: "OK");
    }
  }

  Future<void> uploadImageToImgur(
    XFile image,
    String imageType,
  ) async {
    try {
      const String clientId = '63359fda20ba02f';
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
    } on SocketException catch (_) {
      ReusableDialog.show(
        Get.context!,
        title: "Network Error",
        content: "Please check your internet connection and try again.",
        buttonText: "OK",
      );
    } catch (e) {
      ReusableDialog.show(
        Get.context!,
        title: "Error Uploading Image",
        content: "Image was not uploaded. Please try again.",
        buttonText: "OK",
      );
    }
  }

  Future<bool> checkIfEmailExists(String email) async {
    try {
      QuerySnapshot query = await _firestore
          .collection('doctors')
          .where("Doctoremail", isEqualTo: email)
          .get();
      return query.docs.isNotEmpty; // If email already exists, return true
    } catch (e) {
      print("Error checking email existence: $e");
      return false;
    }
  }
}
