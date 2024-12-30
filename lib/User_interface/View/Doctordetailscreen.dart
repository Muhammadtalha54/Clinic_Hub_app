// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clinic_hub_app/User_interface/View/Book_Appointmentscreen.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';

import 'package:clinic_hub_app/apptheme/Apptheme.dart';

class Doctordetailscreen extends StatefulWidget {
  final int index;
  String imagepath;
  String doctorname;
  Doctordetailscreen({
    Key? key,
    required this.index,
    required this.imagepath,
    required this.doctorname,
  }) : super(key: key);

  @override
  State<Doctordetailscreen> createState() => _DoctordetailscreenState();
}

class _DoctordetailscreenState extends State<Doctordetailscreen> {
  @override
  var height, width;
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Apptheme.appbodybackgroundcolor,
        appBar: AppBar(
          backgroundColor: Apptheme.appbodybackgroundcolor,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              height: height * 1.5,
              width: width * 0.9,
              //  color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'doctor-image-${widget.index}',
                    child: CircleAvatar(
                      radius: width * 0.2,
                      backgroundImage: AssetImage(
                        widget.imagepath,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "Dr.${widget.doctorname}", // Doctor's name
                    style: TextStyle(
                      fontSize: width * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                    width: width * 0.54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Cardiologist",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 88, 88, 88),
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: height * 0.04,
                          width: width * 0.1,
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                            size: width * 0.065,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.165,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _expcard(
                            expicon: Icons.military_tech_outlined,
                            title: "Experience",
                            value: "10 yrs",
                            iconcolor: Colors.red),
                        _expcard(
                            expicon: Icons.people_alt_outlined,
                            title: "Patients",
                            value: "1000+",
                            iconcolor: Colors.blue),
                        _expcard(
                            expicon: Icons.star_border_outlined,
                            title: "Rating",
                            value: "4.7",
                            iconcolor: Colors.amber)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.05,
                    width: width * 0.85,
                    child: Text(
                      "About Doctor",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.2,
                    width: width * 0.85,
                    child: Text(
                      "Dr. John Doe is a highly experienced cardiologist with over 10 years of experience in the field. He has conducted over 500 successful appointments and is known for his compassionate care and expertise",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 89, 89, 89),
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 5,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.045,
                    width: width * 0.85,
                    child: Text(
                      "Availability",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                    width: width * 0.85,
                    child: Text(
                      "Mon-Sat: 9:00 AM - 5:00 PM",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 109, 109, 109),
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Text(
                  //   'Dr. John Doe is a highly experienced cardiologist with over 10 years of experience in the field. He has conducted over 500 successful appointments and is known for his compassionate care and expertise.',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    width: width * 0.85,
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.35,
                    width: width * 0.85,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3, // Limit to 3 reviews initially
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          color: const Color.fromARGB(255, 245, 249, 251),
                          child: Container(
                            height: height * 0.13,
                            width: width * 0.8,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: width * 0.055,
                                backgroundImage: NetworkImage(
                                    "https://static.vecteezy.com/system/resources/thumbnails/030/798/365/small_2x/beautiful-asian-girl-wearing-over-size-hoodie-in-casual-style-ai-generative-photo.jpg"),
                              ),
                              title: Text(
                                'Alia Joseph',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.036,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Great doctor! Very attentive and professional doctor he is a very good doctor and keep on checking the patients.',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 83, 83, 83),
                                    fontSize: width * 0.033,
                                    fontWeight: FontWeight.w400),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Container(
                                width: width * 0.13,
                                child: Row(
                                  children: [
                                    Text(
                                      "(4.5)",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: width * 0.035),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: width * 0.045,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 225, 225, 225)),
                    onPressed: () {
                      // Navigate to see all reviews
                    },
                    child: Text('See All'),
                  ),

                  SizedBox(
                    height: height * 0.03,
                  ),
                  InkWell(
                    // what action to perform is taken as arguments
                    onTap: () {
                      Navigator.of(context).push(
                          CustomPageTransition(page: BookAppointmentScreen()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 7,
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.7,
                        decoration: BoxDecoration(
                          color: Apptheme.mainbackgroundcolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Book Appointment',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: width * 0.042),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

// this card is used to display the rating/ experience of the doctor
  Widget _expcard({
    required IconData expicon,
    required String title,
    required String value,
    required Color iconcolor,
  }) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: Container(
        height: height * 0.165,
        width: width * 0.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.03),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.07,
              width: width * 0.1,
              decoration: BoxDecoration(
                  color: iconcolor.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width * 0.05),
                    bottomRight: Radius.circular(width * 0.05),
                  )),
              child: Center(
                child: Icon(expicon, color: iconcolor, size: width * 0.06),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: width * 0.03,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
