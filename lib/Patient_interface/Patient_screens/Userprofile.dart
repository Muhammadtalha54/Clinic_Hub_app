import 'package:clinic_hub_app/Patient_interface/Patient_ViewModel/Controllers/Updateprofilecontroller.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_models/Staticmodel.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/Imagewidget.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/passwordtextfield.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Userprofilescreen extends StatefulWidget {
  const Userprofilescreen({super.key});

  @override
  State<Userprofilescreen> createState() => _UserprofilescreenState();
}

class _UserprofilescreenState extends State<Userprofilescreen> {
  final ProfileUpdateController _controller =
      Get.put(ProfileUpdateController());

  final String? patientname = StaticPatient.patient_model!.Patientname!;
  String? patientimageurl = StaticPatient.patient_model!.Patientprofilepicture!;
  var height, width;

  @override
  void initState() {
    super.initState();

    // Initialize controller with static patient data
    _controller.name.value = patientname!;
    _controller.email.value = StaticPatient.patient_model!.PatientEmail!;
    _controller.phone.value = StaticPatient.patient_model!.Patientphonenumber!;
    _controller.password.value = StaticPatient.patient_model!.Patientpassword!;
    _controller.selectedprofileimageurl.value =
        patientimageurl!; // Initialize profile image URL
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "User Profile",
          style: TextStyle(
            fontSize: width * 0.055,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 64, 64, 64),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        // Wrap your widget tree with Obx to observe changes from the controller
        return Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(width * 0.04),
          decoration:
              const BoxDecoration(color: Apptheme.appbodybackgroundcolor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              ImageUpload(
                ontap: () {
                  _controller
                      .pickImage('userprofile'); // Use controller to pick image
                },
                imageurl: _controller.selectedprofileimageurl.value.isNotEmpty
                    ? _controller.selectedprofileimageurl.value
                    : patientimageurl!,
              ),
              SizedBox(height: height * 0.05),
              UserInfo(controller: _controller), // Pass controller to UserInfo
            ],
          ),
        );
      }),
    );
  }
}

// Widget for displaying user information with edit functionality
class UserInfo extends StatefulWidget {
  final ProfileUpdateController controller; // Receive controller as a parameter

  const UserInfo({super.key, required this.controller});

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _isEditing = false;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    // Initialize TextEditingController with the static data
    _nameController = TextEditingController(text: widget.controller.name.value);
    _emailController =
        TextEditingController(text: widget.controller.email.value);
    _phoneController =
        TextEditingController(text: widget.controller.phone.value);
    _passwordController =
        TextEditingController(text: widget.controller.password.value);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: SizedBox(
        width: width * 0.8,
        height: height * 0.5,
        child: Column(
          children: [
            _buildTextField(_nameController, 'Name', Icons.person),
            SizedBox(height: height * 0.03),
            _buildTextField(_phoneController, 'Phone', Icons.phone),
            PasswordTextField(
              isEditing: _isEditing,
              controller: _passwordController,
              obscureText: _passwordVisible,
              onVisibilityToggle: _togglePasswordVisibility,
              label: 'Password',
            ),
            SizedBox(height: height * 0.035),
            _isEditing ? _buildEditButtons() : _buildEditProfileButton(),
          ],
        ),
      ),
    );
  }

  // Builds a text field widget
  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextFormField(
      controller: controller,
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
            ),
            child: const Text(
              'Save',
              style: TextStyle(
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
              style: TextStyle(
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
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
      ),
    );
  }

  // Saves the changes made to the user information
  void _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      widget.controller.name.value = _nameController.text;
      widget.controller.email.value = _emailController.text;
      widget.controller.phone.value = _phoneController.text;
      widget.controller.password.value = _passwordController.text;

      bool? confirmed = await widget.controller.showConfirmationDialog(context);
      setState(() => _isEditing = false);
    }
  }
}
