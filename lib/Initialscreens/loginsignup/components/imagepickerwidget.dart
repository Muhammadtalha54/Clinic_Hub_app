import 'dart:io';
import 'package:flutter/material.dart';
// this is the widget for handling and displaying the lisence that the doctor
//uploaded

class UploadLicenseWidget extends StatelessWidget {
  // selected file and the ontap method will be accepted as arguments
  final File? selectedImage;
  final VoidCallback onTap;

  const UploadLicenseWidget({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap, // Trigger the onTap callback passed from parent
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red, // Simple red border
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        height: height * 0.3,
        width: width * 0.8,
        alignment: Alignment.center,
        // if no image selected (uploaded by the user)
        child: selectedImage == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload,
                    size: width * 0.1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Upload Your License',
                    style: TextStyle(
                      fontSize: width * 0.038,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
              // displays the image that the doctor uploaded
              //ClipRect is a widget used to clip its child to a rectangular boundary. 
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  selectedImage!,
                  fit: BoxFit.contain,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
      ),
    );
  }
}
