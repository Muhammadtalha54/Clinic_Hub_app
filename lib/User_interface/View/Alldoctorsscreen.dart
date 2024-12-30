import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/Searchboxwidget.dart';
import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/categorywidget.dart';
import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/doctordetail2.dart';
import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/doctordetailwidget.dart';
import 'package:clinic_hub_app/User_interface/View/Doctordetailscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';

class All_Doctors_list_screen extends StatefulWidget {
  const All_Doctors_list_screen({
    super.key,
  });

  @override
  State<All_Doctors_list_screen> createState() =>
      _All_Doctors_list_screenState();
}

class _All_Doctors_list_screenState extends State<All_Doctors_list_screen> {
  // List<Model> selectedList = [];
  var height, width;
  int selectedIndex = 0;
  TextEditingController searchcontroller = TextEditingController();

  // int i = 0;
  // void initState() {
  //   selectedList = Model.snackslist;
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Apptheme.appbodybackgroundcolor,
        automaticallyImplyLeading: false,
        title: Text(
          "Doctors",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: width * 0.05,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: height * 0.85,
          width: width,
          // color: Color.fromARGB(255, 209, 0, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchBoxReusable(
                  controller: searchcontroller,
                  hintText: "Find Doctors",
                  onbuttonpress: () {},
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(
                  height: height * 0.08,
                  width: width * 0.9,

                  //color: Colors.red,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      // Extract data for the current item
                      String name = categories[index]['name'];
                      IconData icon = categories[index]['icon'];

                      // Pass data to the CategoryIconWidget
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.01),
                          child: Categoryiconwidget(
                            categoryname: name,
                            categoryicon: icon,
                            isSelected: selectedIndex == index,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height! * 0.62,
                  width: width,
                  //  color: Colors.amber,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of cloums
                              // crossAxisSpacing: 5.0,
                              mainAxisSpacing: 2.0,
                              childAspectRatio: 0.8
                              //for adjusting container size
                              ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(9),
                          //bsckground container
                          //inkwell to get on product detail page
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageTransition(
                                    page: Doctordetailscreen(
                                  imagepath: 'assets/images/doctor.png',
                                  index: index,
                                  doctorname: 'Ali Khan',
                                )),
                              );
                            },
                            child: SizedBox(
                                height: height,
                                width: width,
                                // color: Colors.black,
                                child: Hero(
                                  tag: 'doctor-image-$index',
                                  child: const Doctordetailwidget(
                                    imagepath: 'assets/images/doctor.png',
                                    doctorName: 'Ali Khan',
                                    reviews: 74,
                                    specialty: 'Dentist',
                                    rating: 4.5,
                                  ),
                                )),
                          ),
                        );
                      }),
                ),
              ]),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> categories = [
    {'name': 'Doctor', 'icon': Icons.medical_services},
    {'name': 'Pharmacy', 'icon': Icons.local_pharmacy},
    {'name': 'Lab', 'icon': Icons.science},
    {'name': 'Hospital', 'icon': Icons.local_hospital},
  ];
}
