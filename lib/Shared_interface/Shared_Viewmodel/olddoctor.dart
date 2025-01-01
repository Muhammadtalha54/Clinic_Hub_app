// this is the old code for the signup screen and should be discarded when it the other will be used


// import 'dart:convert';
// import 'dart:io';

// import 'package:clinic_hub_app/Doctor_interface/Models/Doctor_model.dart';
// import 'package:clinic_hub_app/Shared_screens/Resources/components/reusabeldialog.dart';
// import 'package:clinic_hub_app/Shared_screens/View/Verificationscreen/verifyemail.dart';
// import 'package:clinic_hub_app/Shared_screens/View/loginsignup/screens/Loginscreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart';

// 
//class DoctorSignupController extends GetxController {
//   // Form Key
//   final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

//   // Text Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController lisenceController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   @override
//   // void onClose() {
//   //   nameController.dispose();
//   //   emailController.dispose();
//   //   passwordController.dispose();
//   //   dobController.dispose();
//   //   experienceController.dispose();
//   //   descriptionController.dispose();
//   //   super.onClose();
//   // }

//   RxString? selectedlisenceimageurl = ''.obs;
//   RxString? selectedprofileimageurl = ''.obs;

//   // Password visibility flag
//   RxBool passwordVisible = true.obs;

//   // Selected category for doctor
//   RxString selectedCategory = 'General Physician'.obs;

//   // Gender selection
//   RxString selectedGender = ''.obs;

//   // Method to clear all controllers and variables
//   void clearForm() {
//     nameController.clear();
//     emailController.clear();
//     passwordController.clear();
//     lisenceController.clear();
//     dobController.clear();
//     experienceController.clear();
//     descriptionController.clear();
//     selectedlisenceimageurl!.value = '';
//     selectedprofileimageurl!.value = '';
//     selectedCategory.value = 'General Physician';
//     selectedGender.value = '';
//   }

//   // Image picker instance
//   final ImagePicker _picker = ImagePicker();

//   // Method to toggle password visibility
//   void togglePasswordVisibility() {
//     passwordVisible.value = !passwordVisible.value;
//   }

//   //doctor categories
//   final List<RxString> doctorCategories = [
//     "General Physician".obs,
//     "Cardiologist".obs,
//     "Dermatologist".obs,
//     "Neurologist".obs,
//     "Orthopedic".obs,
//     "Pediatrician".obs,
//     "Psychiatrist".obs,
//     "Gynecologist".obs,
//     "Dentist".obs,
//     "ENT Specialist".obs,
//   ];
//   // variables for the firebase auth and  firebse core
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Method to update gender
//   void updateGender(String gender) {
//     selectedGender.value = gender;
//   }

//   // Method to submit the form
//   void submitForm(BuildContext context) async {
//     if (signupFormKey.currentState?.validate() ?? false) {
//       try {
//         // Register the user
//         UserCredential userCredential =
//             await _auth.createUserWithEmailAndPassword(
//           email: emailController.text,
//           password: passwordController.text,
//         );

//         // Send email verification
//         await userCredential.user?.sendEmailVerification();

//         // Show dialog to ask the user to verify their email
//         ReusableDialog.show(
//           context,
//           title: "Email Verification",
//           content: "Please verify your email before proceeding.",
//           buttonText: "OK",
//           onPressed: () {
//             // Additional logic after closing the dialog (optional)
           
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Emailverificationscreen(
//             ontap: () {
//               // Handle login action
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Loginscreen(),
//                 ),
//               );
//             },
//             retryonpress: () async {
//               await userCredential.user?.sendEmailVerification();
//             }, 
//           ),
//         ),
//       );
//           },
//         );

//         // Wait for email verification
//         await _waitForEmailVerification(userCredential.user);

//         // Store doctor details in Firestore
//         Doctor_Model doctor = createDoctorModel();
//         await _storeDoctorData(doctor);

//         // Navigate to the next screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Emailverificationscreen(
//               ontap: () {
//                 // Handle login action here
//               },
//               retryonpress: () {
//                 // Handle resend code action here
//               },
//               isVerified: true, // Set to true after verification
//             ),
//           ),
//         );
//         clearForm();
//       } on FirebaseAuthException catch (e) {
//         // Handle errors like email already in use
//         if (e.code == 'email-already-in-use') {
//           ReusableDialog.show(
//             context,
//             title: "Sign-Up Failed",
//             content: "The email address is already in use by another account.",
//             buttonText: "OK",
//           );
//         } else if (e.code == 'weak-password') {
//           ReusableDialog.show(
//             context,
//             title: "Sign-Up Failed",
//             content:
//                 "The password is too weak. Please choose a stronger password.",
//             buttonText: "OK",
//           );
//         } else if (e.code == 'invalid-email') {
//           ReusableDialog.show(
//             context,
//             title: "Sign-Up Failed",
//             content:
//                 "The email address is not valid. Please enter a valid email.",
//             buttonText: "OK",
//           );
//         } else {
//           ReusableDialog.show(
//             context,
//             title: "Sign-Up Failed",
//             content: "An error occurred: ${e.message}",
//             buttonText: "OK",
//           );
//         }
//       }
//     }
//   }

//   // Helper function to wait for email verification
//   Future<void> _waitForEmailVerification(User? user) async {
//     while (user != null && !user.emailVerified) {
//       await user.reload();
//       user = _auth.currentUser;
//       await Future.delayed(
//           Duration(seconds: 3)); // Delay to prevent infinite loop
//     }
//   }

//   // handling and saving the data

//   Doctor_Model createDoctorModel() {
//     var id = Uuid();
//     var doctorid = id.v4();
//     return Doctor_Model(
//       doctorid: doctorid,
//       doctorname: nameController.text,
//       Doctoremail: emailController.text,
//       password: passwordController.text,
//       doctorlisencenumber: lisenceController.text,
//       doctorDOB: DateTime.tryParse(dobController.text),
//       doctorexperience: experienceController.text,
//       doctordescription: descriptionController.text,
//       doctorspecialization: selectedCategory.value,
//       doctorgender: selectedGender.value,
//       doctorimageurl: selectedprofileimageurl!.value,
//       doctorlisenceimageurl: selectedlisenceimageurl!.value,
//     );
//   }

//   // this function sets the fields value and the name in the data base
//   Future<void> _storeDoctorData(Doctor_Model doctor) async {
//     try {
//       // Create a document reference in Firestore
//       await _firestore.collection('doctors').doc().set({
//         'docotrid': doctor.doctorid,
//         'doctorname': doctor.doctorname,
//         'Doctoremail': doctor.Doctoremail,
//         'password':
//             doctor.password, // Store password securely or use Firebase Auth
//         'doctorlisencenumber': doctor.doctorlisencenumber,
//         'doctorDOB': doctor.doctorDOB,
//         'doctorexperience': doctor.doctorexperience,
//         'doctordescription': doctor.doctordescription,
//         'doctorspecialization': doctor.doctorspecialization,
//         'doctorgender': doctor.doctorgender,
//         'doctorimageurl': doctor.doctorimageurl,
//         'doctorlisenceimageurl': doctor.doctorlisenceimageurl,
//       });
//     } catch (e) {
//       print("Error storing doctor data: $e");
//     }
//   }

//   //picks image fromgallery
//   Future<void> pickImage(String imageType) async {
//     try {
//       // Pick an image from gallery
//       final XFile? pickedFile =
//           await _picker.pickImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         // If an image is selected, store it in the appropriate variable
//         if (imageType == 'profile') {
//           // Reset the URL before uploading (optional)
//           selectedprofileimageurl!.value = '';
//           await uploadImageToImgur(pickedFile, 'profile');
//         } else if (imageType == 'license') {
//           // Reset the URL before uploading (optional)
//           selectedlisenceimageurl!.value = '';
//           await uploadImageToImgur(pickedFile, 'license');
//         }
//       }
//     } catch (e) {
//       // Handle any errors during image picking
//       print('Error picking image: $e');
//     }
//   }

//   // Function to upload an image to Imgur and get the URL
//   Future<void> uploadImageToImgur(XFile image, String imageType) async {
//     try {
//       final String clientId =
//           '63359fda20ba02f'; // Replace with your Imgur Client ID
//       final bytes = await image.readAsBytes(); // Read image as bytes

//       final uri = Uri.parse('https://api.imgur.com/3/upload');
//       final headers = {
//         'Authorization': 'Client-ID $clientId',
//       };

//       final body = {
//         'image': base64Encode(bytes),
//         'type': 'base64', // Specify the type as base64
//       };

//       // Create the multipart request
//       final request = http.MultipartRequest('POST', uri)
//         ..headers.addAll(headers)
//         ..fields['hidden'] = 'true' // Make the image hidden
//         ..files.add(http.MultipartFile.fromBytes('image', bytes,
//             filename: 'image.jpg'));

//       // Send the request
//       final response = await request.send();
//       final responseData = await http.Response.fromStream(response);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> json = jsonDecode(responseData.body);
//         final String imageUrl = json['data']['link']; // Extract the image URL

//         // Store the URL in the respective variable
//         if (imageType == 'profile') {
//           selectedprofileimageurl!.value = imageUrl;
//           print(selectedprofileimageurl!
//               .value); // Print the URL for the profile image
//         } else if (imageType == 'license') {
//           selectedlisenceimageurl!.value = imageUrl;
//           print(selectedlisenceimageurl!
//               .value); // Print the URL for the license image
//         }
//       } else {
//         print('Error uploading image: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle any errors during the upload process
//       print('Error uploading image: $e');
//     }
//   }
// }
