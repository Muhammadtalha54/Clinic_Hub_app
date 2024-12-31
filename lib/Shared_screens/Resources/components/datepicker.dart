import 'package:flutter/material.dart';
// this is the  reusable date time picker 
class CustomDateTimePicker extends StatelessWidget {
  final TextEditingController controller; // Controller to manage selected date
  final String label; // Label to display above the picker

  const CustomDateTimePicker({
    super.key,
    
    required this.label, required this.controller,
  });
// function that sets the the current date and the selected date called on the textfield ontap
  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
//displays the selected date in the field
    if (selectedDate != null) {
      // this is the format in which we want to display the date
      String formattedDate =
          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      controller.text =
          formattedDate; // Update the controller with the selected date
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.0072, horizontal: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label above the TextField
          Padding(
            padding: EdgeInsets.only(bottom: width * 0.008),
            child: Text(
              label,
              style: TextStyle(
                fontSize: width * 0.038,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          // Date TextField
          SizedBox(
            width: width * 0.8,
            height: height * 0.06,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select your Date of Birth";
                }
                return null;
              },
              controller: controller,
              readOnly: true, // Prevent manual input
              onTap: () => _selectDate(context), // Open date picker on tap
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 137, 137, 137), width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2),
                ),
                hintText: "Date of birth",
                suffixIcon: const Icon(Icons.calendar_today),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
