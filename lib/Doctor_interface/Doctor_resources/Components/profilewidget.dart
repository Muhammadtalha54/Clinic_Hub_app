import 'package:flutter/material.dart';
// this is the widget that is shown as the options on the account screen
class Doctorprofilewidget extends StatelessWidget {
  final String Title;
  final IconData icon;
  final VoidCallback onpressed;
  final Color iconcolor;
  final double height;
  final double width;

  const Doctorprofilewidget({
    Key? key,
    required this.Title,
    required this.icon,
    required this.onpressed,
    this.iconcolor = Colors.grey,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Ensures ripple effect works
      child: InkWell(
        onTap: onpressed,
        child: Card(
          elevation: 1,
          color: const Color.fromARGB(255, 251, 245, 245),
          child: SizedBox(
            height: height,
            width: width,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: iconcolor.withOpacity(0.2),
                radius: width * 0.07,
                child: Center(
                  child: Icon(
                    icon,
                    color: iconcolor,
                    size: width * 0.08,
                  ),
                ),
              ),
              title: Text(
                Title,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: width * 0.065,
                color: const Color.fromARGB(255, 83, 83, 83),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
