import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/Schedulecard.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/Searchboxwidget.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/doctordetail2.dart';

import 'package:clinic_hub_app/Patient_interface/Patient_screens/Doctordetailscreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/Notificationsscreen.dart';

import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:google_fonts/google_fonts.dart';

// this is the home screen for the user he/she 
//will navigate to this page after the login
//1st screen in pageview
class Patient_homescreen extends StatefulWidget {
  const Patient_homescreen({super.key});

  @override
  State<Patient_homescreen> createState() => _Patient_homescreenState();
}

class _Patient_homescreenState extends State<Patient_homescreen> {
  int selectedIndex = 0;
  var height, width;
  TextEditingController searhcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
            child: SizedBox(
          height: height * 1.2,
          width: width * 0.93,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              _myCustomheader(
                name: "Talha Rana",
                Notifications_count: 2,
                ontap: () {
                  Navigator.of(context)
                      .push(CustomPageTransition(page: NotificationsScreen()));
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              // this is a reusable component placed in recources/components
              SearchBoxReusable(
                  controller: searhcontroller,
                  hintText: "",
                  onbuttonpress: () {
                    Navigator.of(context).push(
                        CustomPageTransition(page: NotificationsScreen()));
                  }),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                  height: height * 0.033,
                  width: width * 0.85,
                  child: _headings(headingtitle: "Upcoming schedule")),
              SizedBox(
                height: height * 0.25,
                //color: const Color.fromARGB(255, 167, 109, 105),
                child: CardSwiper(
                  // maxAngle: 190,
                  backCardOffset: const Offset(10, 30),
                  scale: 0.8,

                  cardsCount: cards.length,
                  cardBuilder:
                      (context, index, percentThresholdX, percentThresholdY) =>
                          cards[index],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                  height: height * 0.033,
                  width: width * 0.85,
                  child: _headings(headingtitle: "Top Doctors")),
              SizedBox(
                height: height * 0.65,
                width: width,
                //color: Colors.red,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                          //  horizontal: width * 0.01,
                          vertical: height * 0.00,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              CustomPageTransition(
                                  page: Doctordetailscreen(
                                index: index,
                                imagepath: 'assets/images/doctor.png',
                                doctorname: 'Ali Khan',
                              )),
                            );
                          },
                          child: Hero(
                            tag: 'doctor-image-$index',
                            child: const Doctordetailwidget2(
                              imagepath: 'assets/images/doctor.png',
                              doctorName: 'Ali Khan',
                              reviews: 74,
                              specialty: 'Dentist',
                              rating: 4.5,
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  List<customSchedulecardwidget> cards = [
    customSchedulecardwidget(
      // Height: height * 0.2,
      // Width: width * 0.9,

      cardtitle: "Dr ALi khan",
      cardbody: "Cardiologist",
      imageurl: "assets/images/doctor.png",
      onbuttonpress: () {},
      textcolor: Colors.white,
      schedule: 'Nov 3, 9:00am',
      buttoncolor: const Color.fromARGB(255, 255, 255, 255),
      buttontextcolor: Colors.green,
    ),
    customSchedulecardwidget(
      // Height: height * 0.2,
      // Width: width * 0.9,

      cardtitle: "Dr ALi khan",
      cardbody: "Cardiologist",
      imageurl: "assets/images/doctor.png",
      onbuttonpress: () {},
      textcolor: Colors.white,
      schedule: 'Nov 3, 9:00am',
      buttoncolor: const Color.fromARGB(255, 255, 255, 255),
      buttontextcolor: Colors.green,
    ),
    customSchedulecardwidget(
      // Height: height * 0.2,
      // Width: width * 0.9,

      cardtitle: "Dr ALi khan",
      cardbody: "Cardiologist",
      imageurl: "assets/images/doctor.png",
      onbuttonpress: () {},
      textcolor: Colors.white,
      schedule: 'Nov 3, 9:00am',
      buttoncolor: const Color.fromARGB(255, 255, 255, 255),
      buttontextcolor: Colors.green,
    ),
  ];
  // this is the top header

  Widget _myCustomheader(
      {required String name,
      required double Notifications_count,
      required VoidCallback ontap}) {
    return Container(
      height: height * 0.07,
      width: width,
      decoration: const BoxDecoration(),
      child: ListTile(
        leading: CircleAvatar(
          radius: width * 0.06,
          backgroundColor: const Color.fromARGB(255, 114, 0, 0),
        ),
        title: Text(
          'Hi, $name',
          style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "How are you today?",
          style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.035,
              fontWeight: FontWeight.normal),
        ),
        trailing: Container(
          height: height * 0.07,
          width: width * 0.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 175, 224, 253),
            borderRadius: BorderRadius.circular(width * 0.07),
          ),
          child: Center(
            child: IconButton(
              icon: Badge.count(
                count: Notifications_count.toInt(),
                child: Icon(
                  Icons.notifications_outlined,
                  size: width * 0.06,
                  color: Colors.grey.shade600,
                ),
              ),
              onPressed: ontap,
            ),
          ),
        ),
      ),
    );
  }


// this is the heading widget
  Widget _headings({required final String headingtitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          headingtitle,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: width * 0.045,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "see all",
          style: GoogleFonts.inter(
            color: Apptheme.mainbackgroundcolor,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  } //

  final List<Map<String, dynamic>> categories = [
    {'name': 'Doctor', 'icon': Icons.medical_services},
    {'name': 'Pharmacy', 'icon': Icons.local_pharmacy},
    {'name': 'Lab', 'icon': Icons.science},
    {'name': 'Hospital', 'icon': Icons.local_hospital},
  ];
}



// this is saved for later use
  // child: ListWheelScrollView.useDelegate(
                //     // size of each item in the main axis
                //     itemExtent: 150,
                //     diameterRatio: 7,

                //     //initial index
                //     controller: FixedExtentScrollController(initialItem: 1),
                //     // stops on the nearest item when the user stops scrolling
                //     physics: const BouncingScrollPhysics(),
                //     childDelegate: ListWheelChildBuilderDelegate(
                //       childCount: 10,
                //       builder: (context, index) {
                //         return Doctordetailwidget();
                //       },
                //     )),