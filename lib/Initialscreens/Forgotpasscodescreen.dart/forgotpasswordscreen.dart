import 'package:clinic_hub_app/Initialscreens/Forgotpasscodescreen.dart/Newpasswordscreen.dart';
import 'package:clinic_hub_app/Initialscreens/Verificationscreen/verifyemail.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/customtextfield.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: height,
            width: width,
            color: Color.fromRGBO(248, 248, 248, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height! * 0.05,
                  width: width! * 0.9,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: Color.fromRGBO(8, 40, 98, 1),
                            size: width! * 0.06,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.3,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/coloredlogo.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: height! * 0.07,
                ),
                Text(
                  "Forgot password ",
                  style: TextStyle(
                      color: Apptheme.mainbackgroundcolor,
                      fontSize: width! * 0.045,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height! * 0.035,
                ),
                Text(
                  "Enter email address to receive a\n      4 digit verification code ",
                  style: TextStyle(
                    color: Color.fromRGBO(34, 34, 34, 0.5),
                    fontSize: width! * 0.04,
                  ),
                ),
                SizedBox(
                  height: height! * 0.018,
                ),
                CustomTextFormField(
                  hintText: "john@example.com",
                  regex: r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",

                  // leadingIcon: Icons.email,
                  errorMessage: "Enter a valid email address",
                  controller: emailcontroller, label: '',
                ),
                SizedBox(
                  height: height! * 0.03,
                ),
                Card(
                  elevation: 5,
                  shadowColor: Color.fromARGB(255, 170, 168, 168),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print(emailcontroller.text);

                        Navigator.of(context).push(CustomPageTransition(
                          page: Emailverificationscreen(
                            ontap: () {
                              Navigator.of(context).push(CustomPageTransition(
                                  page: Newpasswordscreen()));
                            },
                            onpress: () {
                              //                         Navigator.of(context).push(CustomPageTransition(
                              //   page: email()
                              // ));
                            },
                          ),
                        ));
                      }
                    },
                    child: Container(
                      height: height! * 0.066,
                      width: width! * 0.86,
                      decoration: BoxDecoration(
                        color: Apptheme.mainbackgroundcolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: width! * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
