import 'package:clinic_hub_app/Initialscreens/loginsignup/components/passwordtextfield.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Newpasswordscreen extends StatefulWidget {
  const Newpasswordscreen({super.key});

  @override
  State<Newpasswordscreen> createState() => _NewpasswordscreenState();
}

class _NewpasswordscreenState extends State<Newpasswordscreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordcontroller = TextEditingController();
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                height: height! * 0.05,
              ),
              Container(
                height: height * 0.2,
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
                "Reset password ",
                style: TextStyle(
                    color: Apptheme.mainbackgroundcolor,
                    fontSize: width! * 0.045,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height! * 0.035,
              ),
              Text(
                "Enter a new password",
                style: TextStyle(
                  color: Color.fromRGBO(34, 34, 34, 0.5),
                  fontSize: width! * 0.04,
                ),
              ),
              SizedBox(
                height: height! * 0.018,
              ),
              PasswordTextField(
                controller: passwordcontroller,
                obscureText: _passwordVisible,
                onVisibilityToggle: _togglePasswordVisibility,
                label: '',
              ),
              PasswordTextField(
                controller: passwordcontroller,
                obscureText: _passwordVisible,
                onVisibilityToggle: _togglePasswordVisibility,
                label: '',
              ),
              SizedBox(
                height: height! * 0.03,
              ),
              Card(
                elevation: 5,
                shadowColor: Color.fromARGB(255, 162, 158, 158),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => (),
                    //     ));
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
    );
  }

  bool _passwordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}
