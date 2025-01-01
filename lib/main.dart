import 'package:clinic_hub_app/Splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splashscreen());
  }
}
// static String Token = '';
//   late FirebaseMessaging messaging;

//   /////////////////
//   // getToken() {
//   //   messaging = FirebaseMessaging.instance;
//   //   messaging.getToken().then((value) {
//   //     if (value != null) {
//   //       Token = value;
//   //     }
//   //     print("token is");
//   //     print(value);
//   //   });
//   // }
//   /////////////
//   ///