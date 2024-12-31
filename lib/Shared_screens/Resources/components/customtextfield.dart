import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// this is the custom reusabe textfield for the text inputs
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hintText, errorMessage; // Added label parameter
  // Only used if obscureText is true
  final String? regex; // Optional parameter for regex validation
  final bool isEditing;
  final int? maxlines;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    // Only used if obscureText is true
    this.regex,
    required this.hintText,
    required this.errorMessage,
    required this.isEditing,
    this.maxlines, // Optional parameter for regex validation
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
            height: height * 0.065,
            width: width * 0.8,
            child: TextFormField(
              //   maxLines: maxlines,
              readOnly: !isEditing,
              style: GoogleFonts.inter(
                  fontSize: width * 0.033,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 73, 73, 73)),
              cursorColor: Colors.grey,
              controller: controller,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return '$label is required';
                }
                // Regex validation if provided
                if (regex != null && !RegExp(regex!).hasMatch(text)) {
                  return errorMessage;
                }
                return null;
              },
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 128, 217, 213),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.inter(
                  fontSize: width * 0.035,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
