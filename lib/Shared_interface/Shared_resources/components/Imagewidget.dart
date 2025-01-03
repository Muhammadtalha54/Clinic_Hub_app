// Widget for uploading and displaying user profile image
import 'package:flutter/material.dart';

// this is the widget which is used for the image upload functionality
class ImageUpload extends StatelessWidget {
  final String imageurl;
  final VoidCallback ontap;
  const ImageUpload({super.key, required this.imageurl, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: height * 0.18,
        width: width * 0.3,
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: height,
              width: width * 0.28,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
                image: imageurl.isNotEmpty
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageurl),
                      )
                    : null,
              ),
              child: imageurl.isEmpty
                  ? CircleAvatar(
                      radius: width * 0.14,
                      backgroundColor: const Color.fromARGB(255, 70, 70, 70),
                    )
                  : null,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
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
                          color: const Color.fromARGB(255, 237, 237, 237),
                          width: 2.5,
                        ),
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 21, 139, 235),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          size: width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
