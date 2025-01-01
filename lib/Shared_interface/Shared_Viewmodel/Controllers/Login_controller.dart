// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginController extends GetxController{
//  final GlobalKey<FormState> _Loginformkey = GlobalKey<FormState>();


//     void _handleLogin() async {
//     QuerySnapshot query = await FirebaseFirestore.instance
//         //This is the starting point to access the Firestore database in your Flutter app.
//         .collection('Users')
//         // It specifies that you want to work with a collection named "People" in your Firestore database.

//         .where("Email", isEqualTo: emailController.text)
//         //This line adds a filter to the query. It says you want to retrieve documents where the "email" field matches the value stored in the emailcontroller.text variable.
//         .where("password", isEqualTo: passwordController.text)
//         //This executes the query and retrieves the documents that meet the specified conditions.
//         .get();
//     //message to be shown when the data does not match
//     if (query.docs.isEmpty) {
//       // print("email or passord is incorrect");
//       _Incorrectpopup(context);
//     } else {
//       //This line prints the data of the first document
//       print(query.docs[0].data());
//       //Here, it creates a People object named model by converting the data from the first document in the query result into an instance of the People class.
//       Users model = Users.fromMap(query.docs[0].data() as Map<String, dynamic>);
//       Staticdata.userModel = model;
//       // Staticdata.userModel.

//       print(model);
//       saveLoginDataToSF(model.userId!);
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeScreen(),
//           ));
//       if (_formKey.currentState!.validate()) {
//         // print(emailcontroller.text);
//         //print(passwordController.text);
//       }
//     }
//   }
  
//   saveLoginDataToSF(String id) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('userId', id);
//   }

// }