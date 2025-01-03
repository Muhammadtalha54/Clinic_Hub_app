import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Widget to handle and display the license image that the doctor uploaded
class UploadLicenseWidget extends StatelessWidget {
  // Observable RxString to hold the selected image URL
  final String? selectedImage;
  final VoidCallback onTap;
  final bool isloading;

  const UploadLicenseWidget({
    super.key,
    required this.selectedImage,
    required this.onTap, required this.isloading,
  });

  @override
  Widget build(BuildContext context) {
    print(
        'this is the image url: ${selectedImage!}'); // Logging the value of selectedImage
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
        child: // Obx(() {
            // Use Obx to reactively rebuild the widget when selectedImage changes
            (selectedImage!.isEmpty)
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
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      selectedImage! , // Observing the RxString for changes
                      fit: BoxFit.contain,
                      height: double.infinity,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            size: 40,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
  // }
  // ),
}
