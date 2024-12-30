import 'dart:io';

import 'package:clinic_hub_app/Doctor_interface/View/requeststatusscreen.dart';
import 'package:clinic_hub_app/Initialscreens/Verificationscreen/verifyemail.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/Imageuploadsignup.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/customtextfield.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/datepicker.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/dropdowndoctor.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/genderselection.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/imagepickerwidget.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/passwordtextfield.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/Imagewidget.dart';

import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
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
  // // tabcontroller made for the tabbar haveing 2 tabs
  // late final TabController _tabController =
  //     TabController(length: 2, vsync: this);

// signup form key
  final _SignupformKey = GlobalKey<FormState>();
  //variable for th eobscure text in the password textfield
  bool _passwordVisible = false;

  // final bool _check = false;
  // all the textfields controllers
  final TextEditingController Namecontroller = TextEditingController();
  final TextEditingController Emailcontroller = TextEditingController();
  final TextEditingController Passwordcontroller = TextEditingController();
  final TextEditingController Lisencecontroller = TextEditingController();
  final TextEditingController DOBcontroller = TextEditingController();
  //variable to store the selected item from the dropdown
  String? selectedCategory;
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  // used the dispose to dispose all the controllers when not in use to free up space
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Namecontroller.dispose();
    Emailcontroller.dispose();
    Passwordcontroller.dispose();
    Lisencecontroller.dispose();
    DOBcontroller.dispose();
    _tabController.dispose();
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
                  key: _SignupformKey,
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
                                      controller: Namecontroller,
                                      label: 'Full Name',
                                    ),
                                    CustomTextFormField(
                                      isEditing: true,
                                      hintText: "john@example.com",
                                      regex:
                                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                                      errorMessage:
                                          "Enter a valid email address",
                                      controller: Emailcontroller,
                                      label: 'Email',
                                    ),
                                    // custom built reusable datetimepicker for date and time
                                    CustomDateTimePicker(
                                      controller: DOBcontroller,
                                      label: "Date of Birth",
                                    ),
                                    SizedBox(height: height * 0.02),
                                    // custompasswordtextfield having the password options like obscure text
                                    PasswordTextField(
                                      isEditing: true,
                                      controller: Passwordcontroller,
                                      obscureText: _passwordVisible,
                                      onVisibilityToggle: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      label: 'Password',
                                    ),
                                    SizedBox(height: height * 0.02),
                                    // button on the 1 tab to go to the next tab
                                    ElevatedButton(
                                      onPressed: () {
                                        //  if (_SignupformKey.currentState!
                                        // .validate()) {
                                        _tabController.animateTo(
                                            1); // Move to Step 2 if validation passes
                                        // }
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
                                    Uploadimageonsignup(
                                      selectedImage: _selectedprofileimageImage,
                                      ontap: () {
                                        if (_selectedprofileimageImage !=
                                            null) {
                                          _pickImage(
                                              image:
                                                  _selectedprofileimageImage!);
                                        }
                                      },
                                    ),
                                    CustomTextFormField(
                                      isEditing: true,
                                      hintText: "5 yrs",
                                      regex: r"^[a-zA-Z0-9_]{6,}$",
                                      errorMessage: "Enter YoUr Experience",
                                      controller: Lisencecontroller,
                                      label: 'Experience',
                                    ),
                                    // SizedBox(height: height * 0.02),
                                    CustomTextFormField(
                                      maxlines: 3,
                                      isEditing: true,
                                      hintText: "Enter a short description",
                                      regex: '',
                                      errorMessage: "Enter your Description",
                                      controller: Lisencecontroller,
                                      label: 'Description',
                                    ),
                                    SizedBox(height: height * 0.02),
                                    GenderSelection(
                                      selectedGender: _selectedGender,
                                      onGenderChanged: _onGenderChanged,
                                    ),

                                    ElevatedButton(
                                      onPressed: () {
                                        if (_selectedprofileimageImage !=
                                            null) {
                                          _tabController.animateTo(2);
                                        } else {
                                          _tabController.animateTo(2);

                                          //   _showLicenseDialog();
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
                                      categories: doctorCategories,
                                      selectedCategory: selectedCategory,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedCategory = newValue;
                                        });
                                      },
                                    ),
                                    CustomTextFormField(
                                      isEditing: true,
                                      hintText: "00000-X",
                                      regex: r"^[a-zA-Z0-9_]{6,}$",
                                      errorMessage:
                                          "Enter valid PMC Registration",
                                      controller: Lisencecontroller,
                                      label: 'License Number',
                                    ),
                                    SizedBox(height: height * 0.02),
                                    Center(
                                      child: UploadLicenseWidget(
                                        selectedImage: _selectedLisenceImage,
                                        onTap: () {
                                          if (_selectedLisenceImage != null) {
                                            _pickImage(
                                                image: _selectedLisenceImage!);
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(height: height * 0.02),
                                    ElevatedButton(
                                      onPressed: () {
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

  //image picker components
  File? _selectedLisenceImage; // Store selected image
  File? _selectedprofileimageImage;

  final ImagePicker _picker = ImagePicker(); // Image picker instance

  // Method to pick an image from the gallery
  Future<void> _pickImage({required File image}) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        if (image == _selectedprofileimageImage) {
          _selectedprofileimageImage = File(pickedFile.path);
        } else if (image == _selectedLisenceImage) {
          _selectedLisenceImage = File(pickedFile.path);
        }
      });
    }
  }

//turn on off obscure text on the password textfield
  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

// if lisence is not uploaded then this dialog will be displayed
  void _showLicenseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 7,
        backgroundColor: Colors.white,
        title: const Text("License Upload Required"),
        content: const Text("Please upload your license image to proceed."),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Custom border radius
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // this is the logic for the signup button
  void _submitForm(File selectedImage) {
    if (selectedImage == null) {
      _showLicenseDialog(); // Show dialog if license image is not uploaded
      return;
    }
// this is the validation condition for the page
    // if (_SignupformKey.currentState!.validate()) {
    // Form validation is successful
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //         "Form submitted successfully. Selected category: $selectedCategory"),
    //   ),
    //  );

    // going to the next screen that takes the action on its button as the required parameter
    Navigator.of(context).push(CustomPageTransition(
      page: Emailverificationscreen(
        ontap: () {
          Navigator.of(context)
              .push(CustomPageTransition(page: const DoctorRequeststatus()));
        },
        retryonpress: () {},
      ),
    ));

    // Process the form and save data
    // }
  }

  // for the radio buttons
  String _selectedGender = 'Male'; // Default selected gender

  void _onGenderChanged(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }
}
