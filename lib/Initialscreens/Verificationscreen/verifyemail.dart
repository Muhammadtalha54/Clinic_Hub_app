import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Emailverificationscreen extends StatefulWidget {
  final VoidCallback ontap, onpress;
  Emailverificationscreen(
      {super.key, required this.ontap, required this.onpress});

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
    return Scaffold(
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
                  decoration: BoxDecoration(),
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
                Container(
                  width: width * 0.8,
                  child: Text(
                    "Enter the verification code received on\n your provided email address",
                    style: TextStyle(
                      color: Color.fromRGBO(34, 34, 34, 0.666),
                      fontSize: width! * 0.04,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: height! * 0.05,
                ),
                SizedBox(
                  height: height! * 0.12,
                  width: width! * 0.86,
                  child: Pinput(
                    length: 4,
                    // Without Validator
                    // If true error state will be applied no matter what validator returns
                    forceErrorState: true,
                    // Text will be displayed under the Pinput
                    // errorText: 'Error',

                    /// ------------
                    /// With Validator
                    /// Auto validate after user tap on keyboard done button, or completes Pinput
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    validator: (pin) {
                      if (pin == '2224') return null;

                      /// Text will be displayed under the Pinput
                      return 'Pin is incorrect';
                    },
                  ),
                ),
                SizedBox(
                  height: height! * 0.03,
                ),
                Card(
                  elevation: 5,
                  shadowColor: Color.fromARGB(255, 166, 160, 160),
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
                          "Verify",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
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
                Container(
                  width: width * 0.3,
                  child: Text(
                    "Not received ?",
                    style: TextStyle(
                      color: Color.fromRGBO(8, 40, 98, 1),
                      fontSize: width! * 0.038,
                    ),
                  ),
                ),
                InkWell(
                  onTap: widget.onpress,
                  child: Container(
                    width: width! * 0.38,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Resend Code",
                            style: TextStyle(
                                color: Color.fromRGBO(211, 47, 47, 1),
                                fontSize: width! * 0.046,
                                fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color.fromRGBO(211, 47, 47, 1),
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
    );
  }
}
