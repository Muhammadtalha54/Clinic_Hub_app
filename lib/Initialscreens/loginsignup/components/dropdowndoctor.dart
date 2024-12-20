import 'package:flutter/material.dart';

class DoctorCategoryDropdown extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onChanged;

  const DoctorCategoryDropdown({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select a category";
        }
        return null;
      },
    );
  }
}
