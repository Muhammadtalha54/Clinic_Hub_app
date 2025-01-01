// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadImageOnSignup extends StatelessWidget {
  final String? selectedImageUrl; // This should be a reactive variable
  final VoidCallback ontap;
  bool? isloading = false;

  UploadImageOnSignup({
    Key? key,
    required this.selectedImageUrl,
    required this.ontap,
    this.isloading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: height * 0.18,
        width: width * 0.3,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height,
                width: width * 0.28,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                child: //Obx(() {
                    // Ensure you're checking the reactive variable
                    (selectedImageUrl!.isNotEmpty && isloading == false)
                        ? Image.network(
                            selectedImageUrl!,
                            fit: BoxFit.fitHeight,
                          )
                        : (isloading == false)
                            ? CircleAvatar()
                            : Center(child: CircularProgressIndicator()),

                // }),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: height * 0.05,
                width: width * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ontap,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 237, 237, 237),
                            width: 2.5,
                          ),
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 21, 139, 235),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: width * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
