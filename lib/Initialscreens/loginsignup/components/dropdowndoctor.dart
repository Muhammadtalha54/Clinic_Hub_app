import 'package:flutter/material.dart';

/*dropdown reusable widget that the following items as arguments
1. categories= list of the text that will be displayed in the dropdown
2. the one text that is shown when the dropdown is closes
3.onchanged is used to set the selected item visible on screen

*/


class DoctorCategoryDropdown extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onChanged;

  const DoctorCategoryDropdown({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    //dropdown button having string list
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      value: selectedCategory,
      hint: const Text("Choose a category"),
      items: categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: onChanged,
      // if a category is not selected then it will raise an error
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select a category";
        }
        return null;
      },
    );
  }
}
