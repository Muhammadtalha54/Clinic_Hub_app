import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// this is the reusable component for the password textfield where ever it is used
// this will be called and parameter values will be given

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onVisibilityToggle;
  final String label; // Added label parameter
  final bool isEditing;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onVisibilityToggle,
    required this.label,
    required this.isEditing, // Passing label to the constructor
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.0072,
      ), // Optional for some vertical space
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align label to the left
        children: [
          // Label above the TextField
          Padding(
            padding: EdgeInsets.only(
                bottom: width * 0.008), // Space between label and text field
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: width * 0.038, // You can adjust this size
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.06,
            width: width * 0.8,
            child: TextFormField(
              readOnly: !isEditing,
              obscureText: obscureText,
              style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 73, 73, 73)),
              cursorColor: Colors.grey,

              controller: controller,
              // validatoin for the password
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Password required';
                }
                if (text.length < 8) {
                  return 'Must contain at least 8 characters';
                }
                // if (!RegExp(
                //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                //     .hasMatch(text)) {
                //   return "The password must contain at least 8 characters, an uppercase letter, a lowercase letter, a number, and a symbol";
                // }
                return null;
              },

              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 128, 217, 213),
                //default border
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                    width: 1.5,
                  ),
                ),
                // border displayed when the textfield is in focus
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                hintText: "Password",
                hintStyle: GoogleFonts.inter(
                  fontSize: width * 0.035,
                  color: Colors.grey,
                ),
                suffixIcon: InkWell(
                  // this ontap will be given as argument
                  onTap: onVisibilityToggle,
                  child: Icon(
                    color: const Color.fromARGB(255, 107, 107, 107),
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: width * 0.06,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
