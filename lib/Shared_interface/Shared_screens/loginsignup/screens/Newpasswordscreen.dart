import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/passwordtextfield.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';

/* On this screen After the verification of the email on the emailverificationscreen 
the user/doctorwill set a new password for his/her account so that 
they can access their account
*/

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
          color: const Color.fromRGBO(248, 248, 248, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
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
                      color: const Color.fromRGBO(8, 40, 98, 1),
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
                decoration: const BoxDecoration(
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
                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                  fontSize: width! * 0.04,
                ),
              ),
              SizedBox(
                height: height! * 0.018,
              ),
              // this is a reusable component that is used to handle the password textfields
              PasswordTextField(
                isEditing: true,
                controller: passwordcontroller,
                obscureText: _passwordVisible,
                onVisibilityToggle: _togglePasswordVisibility,
                label: '',
              ),
              PasswordTextField(
                isEditing: true,
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
                shadowColor: const Color.fromARGB(255, 162, 158, 158),
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
                            color: const Color.fromARGB(255, 255, 255, 255),
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

// this variable  and function is used to make the obscure text visible and not
//based on the value of the variable
  bool _passwordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}
