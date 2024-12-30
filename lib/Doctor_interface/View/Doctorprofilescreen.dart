import 'package:clinic_hub_app/Initialscreens/loginsignup/components/customtextfield.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/components/passwordtextfield.dart';
import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/Imagewidget.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';

import 'package:flutter/material.dart';
// the screen on which the doctor can edit his information
class Doctorprofilescreen extends StatefulWidget {
  const Doctorprofilescreen({super.key});

  @override
  State<Doctorprofilescreen> createState() => _DoctorprofilescreenState();
}

class _DoctorprofilescreenState extends State<Doctorprofilescreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Doctor Profile",
          style: TextStyle(
            fontSize: width * 0.055,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 64, 64, 64),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(width * 0.04),
          decoration: BoxDecoration(color: Apptheme.appbodybackgroundcolor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              ImageUpload(
                ontap: () {},
                imageurl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s',
              ),
              SizedBox(height: height * 0.03),
              const DoctorInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for displaying user information with edit functionality
class DoctorInfo extends StatefulWidget {
  const DoctorInfo({super.key});

  @override
  _DoctorInfoState createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'John Doe');
  final _emailController = TextEditingController(text: 'john@example.com');
  final _phoneController = TextEditingController(text: '123-456-7890');
  final _passwordcontroller = TextEditingController(text: '1Myiub.com');
  bool _passwordVisible = true;
  var height, width;

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Container(
        width: width * 0.8,
        height: height * 0.66,
        child: Column(
          children: [
            _buildTextField(
                _nameController, 'Name', Icons.person, height * 0.07, 1),
            SizedBox(height: height * 0.03),
            _buildTextField(
                _emailController, 'Email', Icons.email, height * 0.07, 1),
            SizedBox(height: height * 0.03),
            _buildTextField(
                _phoneController, 'Phone', Icons.phone, height * 0.07, 1),
            PasswordTextField(
              isEditing: _isEditing,
              controller: _passwordcontroller,
              obscureText: _passwordVisible,
              onVisibilityToggle: _togglePasswordVisibility,
              label: 'Password',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            _buildTextField(_phoneController, 'Description',
                Icons.details_outlined, height * 0.12, 3),
            SizedBox(height: height * 0.035),
            _isEditing ? _buildEditButtons() : _buildEditProfileButton(),
          ],
        ),
      ),
    );
  }

  //Builds a text field widget
  Widget _buildTextField(TextEditingController controller, String label,
      IconData icon, double Height, int maxlines) {
    return Container(
      height: Height,
      child: TextFormField(
        controller: controller,
        maxLines: maxlines,
        readOnly: !_isEditing,
        style: const TextStyle(color: Color.fromARGB(255, 73, 73, 73)),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color.fromARGB(179, 38, 38, 38)),
          prefixIcon: Icon(icon, color: const Color.fromARGB(179, 50, 50, 50)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(137, 106, 106, 106)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 70, 70, 70)),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
        ),
      ),
    );
  }

  // Builds the edit buttons (Save and Cancel)
  Widget _buildEditButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _saveChanges,
            style: ElevatedButton.styleFrom(
              backgroundColor: Apptheme.mainbackgroundcolor,
              // foregroundColor: const Color.fromARGB(255, 253, 253, 253),
            ),
            child: const Text(
              'Save',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton(
            onPressed: () => setState(() => _isEditing = false),
            style: OutlinedButton.styleFrom(
              foregroundColor: Apptheme.mainbackgroundcolor,
              side: const BorderSide(color: Color.fromARGB(255, 101, 101, 101)),
            ),
            child: const Text(
              'Cancel',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  // Builds the edit profile button
  Widget _buildEditProfileButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => setState(() => _isEditing = true),
        style: ElevatedButton.styleFrom(
          backgroundColor: Apptheme.mainbackgroundcolor,
          foregroundColor: const Color.fromARGB(255, 253, 253, 253),
        ),
        child: const Text(
          'Edit Profile',
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
      ),
    );
  }

  // Saves the changes made to the user information
  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isEditing = false);
    }
  }
}
