// Widget for uploading and displaying user profile image
import 'package:flutter/material.dart';

class ImageUpload extends StatelessWidget {
  final String imageurl;
  final VoidCallback ontap;
  const ImageUpload({super.key, required this.imageurl, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: height! * 0.18,
        width: width! * 0.3,
        // color: Colors.white,
        child: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                height: height,
                width: width! * 0.28,

                // child: StreamBuilder<DocumentSnapshot>(
                //   stream: FirebaseFirestore.instance
                //       .collection('Users')
                //       .doc(Staticdata.userModel!
                //           .userId) // Assuming your document ID is the user's ID
                //       .snapshots(),
                //   builder: (BuildContext context,
                //       AsyncSnapshot<DocumentSnapshot>
                //           snapshot) {
                //     if (snapshot.connectionState ==
                //         ConnectionState.waiting) {
                //       // Return a placeholder widget while waiting for data
                //       return CircularProgressIndicator();
                //     }
                //     if (snapshot.hasError) {
                //       // Handle error state
                //       return Text(
                //           'Error: ${snapshot.error}');
                //     }
                //     if (!snapshot.hasData ||
                //         snapshot.data!.data() == null) {
                //       // Handle no data state
                //       return Text('No data found');
                //     }
                //     String? profilePicUrl = snapshot
                //         .data!
                //         .get('profilepic');

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageurl ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNwD-geCtaIaqxMoMoBNpvonJNKKqwiko5nA&s'),
                    ),
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: height! * 0.05,
              width: width! * 0.1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ontap,
                      child: Container(
                        height: height! * 0.04,
                        width: width! * 0.1,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 237, 237, 237),
                                width: 2.5),
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 21, 139, 235)),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: width! * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
