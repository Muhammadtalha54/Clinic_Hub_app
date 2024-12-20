import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboaringimageandtext extends StatelessWidget {
  final String imagepath, textmessage, texttitle;
  Onboaringimageandtext({
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
          height: height! * 0.08,
        ),
        Container(
          height: height * 0.43,
          width: width * 0.8,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagepath))),
        ),
        SizedBox(
          height: height! * 0.04,
        ),
        Container(
          height: height! * 0.3,
          width: width,
          decoration: BoxDecoration(color: Color.fromARGB(44, 255, 255, 255)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height * 0.05,
                width: width,
                child: Center(
                  child: Text(
                    texttitle,
                    style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 255, 254, 254),
                        fontSize: width! * 0.06,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                  height: height * 0.2,
                  width: width! * 0.85,
                  child: Text(
                    textmessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 220, 219, 219),
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
