import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Doctor_model.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_ViewModel/Controllers/Get_doctorscontroller.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/Searchboxwidget.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/categorywidget.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/doctordetailwidget.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/Doctordetailscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* This page is for displaying all the doctors
 it holds the search doctor and filter doctor functionality
 */
class All_Doctors_list_screen extends StatefulWidget {
  const All_Doctors_list_screen({
    super.key,
  });

  @override
  State<All_Doctors_list_screen> createState() =>
      _All_Doctors_list_screenState();
}

class _All_Doctors_list_screenState extends State<All_Doctors_list_screen> {
  var height, width;
  int selectedIndex = 0; // For tracking selected category
  String selectedCategory = "All"; // Default category
  final TextEditingController searchController = TextEditingController();

  final GetDoctorscontroller doctorsController =
      Get.put(GetDoctorscontroller());
  List<Doctor_Model> allDoctorsList = []; // Original list of all doctors
  List<Doctor_Model> filteredDoctorsList = []; // Filtered list for display

  @override
  void initState() {
    super.initState();
    // Fetch doctors when the screen is initialized
    doctorsController.getUsers(context).then((_) {
      setState(() {
        allDoctorsList = doctorsController.allUsers;
        filteredDoctorsList =
            List.from(allDoctorsList); // Initially, display all doctors
      });
    });
  }

  void _filterDoctorsByCategory(String category) {
    setState(() {
      if (category == "All") {
        // Show all doctors if "All" is selected
        filteredDoctorsList = List.from(allDoctorsList);
      } else {
        // Filter doctors by category (case-insensitive and trim spaces)
        filteredDoctorsList = allDoctorsList
            .where((doctor) =>
                doctor.doctorspecialization?.trim().toLowerCase() ==
                category.trim().toLowerCase())
            .toList();
      }
    });
  }

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
          child: Column(
            children: [
              // Category selection
              SizedBox(
                height: height * 0.08,
                width: width * 0.9,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String categoryName = categories[index]['name'];
                    IconData categoryIcon = categories[index]['icon'];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          selectedCategory = categoryName;
                        });
                        _filterDoctorsByCategory(categoryName);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: Categoryiconwidget(
                          categoryname: categoryName,
                          categoryicon: categoryIcon,
                          isSelected: selectedIndex == index,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.03),
              // Doctors list or "No doctors" message
              Obx(() {
                if (doctorsController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (filteredDoctorsList.isEmpty) {
                  return Center(
                    child: Text(
                      "No doctors to show",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: filteredDoctorsList.length,
                    itemBuilder: (context, index) {
                      var doctor = filteredDoctorsList[index];
                      return Padding(
                        padding: const EdgeInsets.all(9),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              CustomPageTransition(
                                page: Doctordetailscreen(
                                  doctor: doctor,
                                  imagepath: doctor.doctorimageurl!,
                                  index: index,
                                  doctorname: doctor.doctorname!,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: height,
                            width: width,
                            child: Hero(
                              tag: 'doctor-image-$index',
                              child: Doctordetailwidget(
                                imagepath: doctor.doctorimageurl!,
                                doctorName: doctor.doctorname!,
                                reviews: 55,
                                specialty: doctor.doctorspecialization!,
                                rating: 4.5,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> categories = [
    {'name': 'All', 'icon': Icons.all_inclusive}, // Default category
    {'name': 'General Physician', 'icon': Icons.local_hospital},
    {'name': 'Cardiologist', 'icon': Icons.favorite},
    {'name': 'Dermatologist', 'icon': Icons.brush},
    {'name': 'Neurologist', 'icon': Icons.psychology},
    {'name': 'Orthopedic', 'icon': Icons.accessibility},
    {'name': 'Gynecologist', 'icon': Icons.pregnant_woman},
    {'name': 'Dentist', 'icon': Icons.medical_services},
  ];
}
