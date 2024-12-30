import 'package:flutter/material.dart';
// this is a widget that asks the users either they are patient or doctor used on the selection screen

class Selectoptionscard extends StatelessWidget {
  final String Optiontitle, Optionmessage, buttontext;
  final double height, width;
  final Color buttoncolor, titlecolor;
  final VoidCallback onPressed;
  const Selectoptionscard({
    super.key,
    required this.Optiontitle,
    required this.Optionmessage,
    required this.buttontext,
    required this.height,
    required this.width,
    required this.buttoncolor,
    required this.titlecolor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Optiontitle,
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w600,
                      color: titlecolor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    Optionmessage,
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 90, 90, 90),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: height * 0.16,
                  ),
                  InkWell(
                    // what action to perform is taken as arguments
                    onTap: onPressed,
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: buttoncolor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          buttontext,
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.042),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
