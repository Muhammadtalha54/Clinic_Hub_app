import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';

/* 
This screen will verify the code received on the user/doctor provided 
email address for both sfter the signup and for the forget passcode 
email verification

*/
class Emailverificationscreen extends StatefulWidget {
  // ontap for the verify button
  //retryonpress for resend the code in case user donot get the code
  final VoidCallback? ontap, retryonpress;

  //made the ontap, and retryonpress required so that where ever we use them
  //we can give them customized action every time

  const Emailverificationscreen(
      {super.key, required this.ontap, this.retryonpress});

  @override
  State<Emailverificationscreen> createState() =>
      _EmailverificationscreenState();
}

class _EmailverificationscreenState extends State<Emailverificationscreen> {
  TextEditingController codecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Verification",
            style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              height: height,
              width: width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height! * 0.12,
                  ),
                  Container(
                    height: height * 0.11,
                    width: width * 0.45,
                    decoration: const BoxDecoration(),
                    child: Icon(
                      Icons.person_2_sharp,
                      size: width * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: height! * 0.07,
                  ),
                  Text(
                    "Verify Your Email Address ",
                    style: TextStyle(
                        color: Apptheme.mainbackgroundcolor,
                        fontSize: width! * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height! * 0.035,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      "A verification has been sent to your email address,\nPlease verify the email to proceed",
                      style: TextStyle(
                        color: const Color.fromRGBO(34, 34, 34, 0.666),
                        fontSize: width! * 0.04,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: height! * 0.05,
                  ),
                  //pinput is used to enter the 4 digit code

                  SizedBox(
                    height: height! * 0.03,
                  ),
                  // this is the verify button
                  Card(
                    elevation: 5,
                    shadowColor: const Color.fromARGB(255, 166, 160, 160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: InkWell(
                      onTap: widget.ontap,
                      child: Container(
                        height: height! * 0.066,
                        width: width! * 0.86,
                        decoration: BoxDecoration(
                          color: Apptheme.mainbackgroundcolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: width! * 0.042,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height! * 0.03,
                  ),
                  SizedBox(
                    width: width * 0.3,
                    child: Text(
                      "Not received ?",
                      style: TextStyle(
                        color: const Color.fromRGBO(8, 40, 98, 1),
                        fontSize: width! * 0.038,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: widget.retryonpress ?? () {},
                    child: SizedBox(
                      width: width! * 0.38,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Resend Code",
                              style: TextStyle(
                                  color: const Color.fromRGBO(211, 47, 47, 1),
                                  fontSize: width! * 0.046,
                                  fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: const Color.fromRGBO(211, 47, 47, 1),
                                size: width! * 0.06,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
