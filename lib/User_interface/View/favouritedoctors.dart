import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/doctordetail2.dart';
import 'package:clinic_hub_app/User_interface/View/Doctordetailscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoriteDoctors extends StatefulWidget {
  const FavoriteDoctors({super.key});

  @override
  State<FavoriteDoctors> createState() => _FavoriteDoctorsState();
}

class _FavoriteDoctorsState extends State<FavoriteDoctors> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // final doctors = [
    //   {
    //     'name': 'Dr. Emily Brown',
    //     'specialty': 'Pediatrics',
    //     'image': 'https://via.placeholder.com/150'
    //   },
    //   {
    //     'name': 'Dr. Michael Lee',
    //     'specialty': 'Orthopedics',
    //     'image': 'https://via.placeholder.com/150'
    //   },
    //   {
    //     'name': 'Dr. Sarah Johnson',
    //     'specialty': 'Dermatology',
    //     'image': 'https://via.placeholder.com/150'
    //   },
    // ];

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Favourite doctors",
          style: TextStyle(
            fontSize: width * 0.055,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 64, 64, 64),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: height,
          width: width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text(
              //   'Your favorite doctors',
              //   style: TextStyle(
              //       fontSize: width * 0.05, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  height: height,
                  width: width,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
