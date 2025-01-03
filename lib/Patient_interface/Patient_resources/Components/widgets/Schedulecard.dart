// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// this is the card used for the tips and the schedules that appear on the home screen
class customSchedulecardwidget extends StatelessWidget {
  final Color buttoncolor, textcolor, buttontextcolor;
  final String cardtitle, cardbody, schedule;
  final String imageurl;
  final String message;
  final VoidCallback onbuttonpress;

  customSchedulecardwidget({
    super.key,
    required this.cardtitle,
    required this.cardbody,
    required this.imageurl,
    required this.onbuttonpress,
    required this.buttoncolor,
    required this.textcolor,
    required this.schedule,
    required this.buttontextcolor,
    required this.message,
  });
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    const Color.fromARGB(255, 255, 77, 1),
    Colors.purple,
    Colors.teal,
    Colors.brown,
    Colors.teal,
    Colors.purpleAccent,
    Colors.deepOrangeAccent
  ];

  // Generate a random color
  Color getRandomColor() {
    final random = Random();
    return _colors[random.nextInt(_colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final randomColor = getRandomColor();

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: Container(
        height: height * 0.21,
        width: width,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/patterndesign.webp',
                ),
                fit: BoxFit.cover),
            color: randomColor.withOpacity(1),
            borderRadius: BorderRadius.circular(width * 0.03)),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: randomColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(width * 0.03)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.012,
              vertical: height * 0.012,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height,
                  width: width * 0.38,
                  //  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.09,
                        child: Text(
                          maxLines: 3,
                          message,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              color: textcolor,
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        cardtitle,
                        style: GoogleFonts.inter(
                            color: textcolor,
                            fontSize: width * 0.043,
                            fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   cardbody,
                      //   style: GoogleFonts.inter(
                      //       color: textcolor,
                      //       fontSize: width * 0.035,
                      //       fontWeight: FontWeight.w500),
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: height,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageurl), fit: BoxFit.fitHeight),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
