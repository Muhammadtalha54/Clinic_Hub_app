import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onGenderChanged;

  const GenderSelection({
    Key? key,
    required this.selectedGender,
    required this.onGenderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Gender:', style: TextStyle(fontSize: 18)),
        Row(
          children: [
            Radio<String>(
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                if (value != null) {
                  onGenderChanged(value);
                }
              },
            ),
            const Text('Male'),
            Radio<String>(
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) {
                if (value != null) {
                  onGenderChanged(value);
                }
              },
            ),
            const Text('Female'),
            Radio<String>(
              value: 'Other',
              groupValue: selectedGender,
              onChanged: (value) {
                if (value != null) {
                  onGenderChanged(value);
                }
              },
            ),
            const Text('Other'),
          ],
        ),
      ],
    );
  }
}
