import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*This is a reusable widget for showing the image and the text to be displayed on the 
onboarding screen we have used this on the onboarding screen for 3 times
*/
class Onboaringimageandtext extends StatelessWidget {
  // takes image path , message and title in parameters
  final String imagepath, textmessage, texttitle;
  const Onboaringimageandtext({
    super.key,
    required this.imagepath,
    required this.textmessage,
    required this.texttitle,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.08,
        ),
        //asset image path
        Container(
          height: height * 0.43,
          width: width,
          decoration: BoxDecoration(
            color: const Color.fromARGB(222, 255, 255, 255),
            image: DecorationImage(
                image: AssetImage(imagepath), fit: BoxFit.cover),
          ),
        ),
        // SizedBox(
        //   height: height! * 0.04,
        // ),
        Container(
          height: height * 0.3,
          width: width,
          decoration: const BoxDecoration(
              //  color: Color.fromARGB(169, 165, 235, 253)
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // title
              SizedBox(
                height: height * 0.05,
                width: width,
                child: Center(
                  child: Text(
                    texttitle,
                    style: GoogleFonts.roboto(
                        color: Apptheme.mainbackgroundcolor,
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ), // detail
              SizedBox(
                  height: height * 0.2,
                  width: width * 0.85,
                  child: Text(
                    textmessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        color: Apptheme.mainbackgroundcolor,
                        fontSize: width * 0.05,
                        height: 1.2,
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
