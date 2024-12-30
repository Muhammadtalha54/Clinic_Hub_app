import 'package:flutter/material.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';

class Categoryiconwidget extends StatelessWidget {
  final String categoryname;
  final IconData categoryicon;
  final bool isSelected;

  const Categoryiconwidget({
    super.key,
    required this.categoryname,
    required this.categoryicon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      elevation: isSelected ? 22 : 8,
      shadowColor: isSelected ? Colors.black : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        height: height * 0.1,
        width: width * 0.2,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              categoryicon,
              size: width * 0.06,
              color: Apptheme.mainbackgroundcolor,
            ),
            Text(
              categoryname,
              style: TextStyle(
                color: const Color.fromARGB(255, 56, 56, 56),
                fontSize: width * 0.03,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
