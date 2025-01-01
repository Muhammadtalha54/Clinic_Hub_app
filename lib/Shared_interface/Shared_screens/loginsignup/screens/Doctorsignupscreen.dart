import 'dart:io';

import 'package:clinic_hub_app/Doctor_interface/doctor_viewmodel/Controllers/DoctorSignupcontroller.dart';

import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/Imageuploadsignup.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/customtextfield.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/datepicker.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/dropdowndoctor.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/genderselection.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/imagepickerwidget.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/passwordtextfield.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';

import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
// this is the signup screen for the doctor

class Doctorsignupscreen extends StatefulWidget {
  const Doctorsignupscreen({
    super.key,
  });

  @override
  State<Doctorsignupscreen> createState() => _DoctorsignupscreenState();
}

class _DoctorsignupscreenState extends State<Doctorsignupscreen>
    with SingleTickerProviderStateMixin {
  var height, width;

  final DoctorSignupController doctorSIgnupcotroller =
      Get.put(DoctorSignupController());

  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  //@override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    Get.delete<DoctorSignupController>();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 236, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 236, 248),
        title: const Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: height,
          width: width * 0.92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: height * 0.2,
              // ),
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                //SIgnupform
                child: Form(
                  key: doctorSIgnupcotroller.signupFormKey,
                  child: Container(
                    height: height * 0.8,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      children: [
                        // TabBar at the top
                        TabBar(
                          controller: _tabController,
                          indicatorColor: Colors.green,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          // physics: NeverScrollableScrollPhysics(),
                          tabs: const [
                            Tab(
                              text: "Step 1",
                            ),
                            Tab(text: "Step 2"),
                            Tab(text: "Step 3"),
                          ],
                        ),
                        // TabBarView for content
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _tabController,
                            children: [
                              // Step 1 content
                              Padding(
                                padding: EdgeInsets.all(width * 0.05),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      width: width * 0.8,
                                      child: Text(
                                        "Sign Up as a Doctor",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          fontSize: width * 0.053,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.00,
                                    ),
                                    SizedBox(
                                      width: width * 0.8,
                                      child: Text(
                                        "Create your account to access health services",
                                        style: GoogleFonts.roboto(
                                          color: const Color.fromARGB(
                                              255, 111, 111, 111),
                                          fontSize: width * 0.035,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    //custom built text field for text data
                                    CustomTextFormField(
                                      isEditing: true,
                                      hintText: "Full Name",
                                      errorMessage: "Name is required",
                                      controller:
                                          doctorSIgnupcotroller.nameController,
                                      label: 'Full Name',
                                    ),
                                    CustomTextFormField(
                                      isEditing: true,
                                      hintText: "john@example.com",
                                      regex:
                                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                                      errorMessage:
                                          "Enter a valid email address",
                                      controller:
                                          doctorSIgnupcotroller.emailController,
                                      label: 'Email',
                                    ),
                                    // custom built reusable datetimepicker for date and time
                                    CustomDateTimePicker(
                                      controller:
                                          doctorSIgnupcotroller.dobController,
                                      label: "Date of Birth",
                                    ),
                                    SizedBox(height: height * 0.02),
                                    // custompasswordtextfield having the password options like obscure text
                                    Obx(
                                      () => PasswordTextField(
                                        isEditing: true,
                                        controller: doctorSIgnupcotroller
                                            .passwordController,
                                        obscureText: doctorSIgnupcotroller
                                            .passwordVisible.value,
                                        onVisibilityToggle:
                                            doctorSIgnupcotroller
                                                .togglePasswordVisibility,
                                        label: 'Password',
                                      ),
                                    ),
                                    SizedBox(height: height * 0.02),
                                    // button on the 1 tab to go to the next tab
                                    ElevatedButton(
                                      onPressed: () {
                                        if (doctorSIgnupcotroller
                                            .signupFormKey.currentState!
                                            .validate()) {
                                          _tabController.animateTo(
                                              1); // Move to Step 2 if validation passes
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: const Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Step 2 content
                              Padding(
                                padding: EdgeInsets.all(width * 0.05),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Profile picture',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.04,
                                      ),
                                    ),
                                    // Uploadimageonsignup(
                                    //   selectedImage: _selectedprofileimageImage,
                                    //   ontap: () {
                                    //     if (_selectedprofileimageImage !=
                                    //         null) {
                                    //       _pickImage(
                                    //           image:
                                    //               _selectedprofileimageImage!);
                                    //     }
                                    //   },
                                    // ),
                                    Obx(
                                      () => UploadImageOnSignup(
                                        selectedImageUrl: doctorSIgnupcotroller
                                            .selectedprofileimageurl!.value,
                                        ontap: () =>
                                            doctorSIgnupcotroller.pickImage(
                                          'profile',
                                        ),
                                        isloading: doctorSIgnupcotroller
                                            .isloading.value,
                                      ),
                                    ),
                                    CustomTextFormField(
                                      isEditing: true,
                                      hintText: "5 yrs",
                                      regex: '',
                                      errorMessage: "Enter YoUr Experience",
                                      //to be updated
                                      controller: doctorSIgnupcotroller
                                          .experienceController,
                                      label: 'Experience',
                                    ),
                                    // SizedBox(height: height * 0.02),
                                    CustomTextFormField(
                                      maxlines: 3,
                                      isEditing: true,
                                      hintText: "Enter a short description",
                                      regex: '',
                                      errorMessage: "Enter your Description",
                                      controller: doctorSIgnupcotroller
                                          .descriptionController,
                                      label: 'Description',
                                    ),
                                    SizedBox(height: height * 0.02),
                                    Obx(() => GenderSelection(
                                          selectedGender: doctorSIgnupcotroller
                                              .selectedGender.value,
                                          onGenderChanged: doctorSIgnupcotroller
                                              .updateGender,
                                        )),

                                    ElevatedButton(
                                      onPressed: () {
                                        if (doctorSIgnupcotroller
                                            .signupFormKey.currentState!
                                            .validate()) {
                                          _tabController.animateTo(
                                              2); // Move to Step 2 if validation passes
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: Text("Next",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.035)),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                  ],
                                ),
                              ),
                              // third step
                              Padding(
                                padding: EdgeInsets.all(width * 0.05),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // This is the custom built dropdown button reusable that selects the category of the doctor
                                    DoctorCategoryDropdown(
                                      categories: doctorSIgnupcotroller
                                          .doctorCategories
                                          .map((e) => e.value)
                                          .toList(),
                                      selectedCategory: doctorSIgnupcotroller
                                          .selectedCategory.value,
                                      onChanged: (String? newCategory) {
                                        if (newCategory != null) {
                                          doctorSIgnupcotroller.selectedCategory
                                              .value = newCategory;
                                        }
                                      },
                                    ),
                                    CustomTextFormField(
                                      isEditing: true,
                                      hintText: "00000-X",
                                      regex: r"^[a-zA-Z0-9_]{6,}$",
                                      errorMessage:
                                          "Enter valid PMC Registration",
                                      controller: doctorSIgnupcotroller
                                          .lisenceController,
                                      label: 'License Number',
                                    ),
                                    SizedBox(height: height * 0.02),
                                    Obx(
                                      () => Center(
                                        child: UploadLicenseWidget(
                                          selectedImage: doctorSIgnupcotroller
                                              .selectedlisenceimageurl!.value,
                                          onTap: () => doctorSIgnupcotroller
                                              .pickImage('license'),
                                          isloading: doctorSIgnupcotroller
                                              .isloading.value,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height * 0.02),
                                    ElevatedButton(
                                      onPressed: () {
                                        doctorSIgnupcotroller
                                            .submitForm(context);
                                        Future.delayed(Duration(seconds: 3),
                                            () {
                                          // Safely delete the controller after submission logic is complete.
                                          Get.delete<DoctorSignupController>();
                                        });
                                        // if (_selectedLisenceImage != null) {
                                        //   _submitForm(_selectedLisenceImage!);
                                        // } else {
                                        //   _showLicenseDialog();
                                        // }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: Text("Sign Up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.035)),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    SizedBox(
                                      height: height * 0.07,
                                      width: width * 0.8,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Already have an account?",
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontSize: width * 0.04,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                CustomPageTransition(
                                                    page: const Loginscreen()),
                                              );
                                            },
                                            child: Text(
                                              " Log in",
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 123, 254),
                                                  fontSize: width * 0.04,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// dropdown displays this list it accepts it as a required named parameter
  final List<String> doctorCategories = [
    "General Physician",
    "Cardiologist",
    "Dermatologist",
    "Neurologist",
    "Orthopedic",
    "Pediatrician",
    "Psychiatrist",
    "Gynecologist",
    "Dentist",
    "ENT Specialist",
  ];
}

//   