import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
// this is the doctor detail widget which shows essential details of the doctor
// to the pateint and is used on the All doctors screen
class Doctordetailwidget extends StatelessWidget {
  final String imagepath, doctorName, specialty;
  final double rating, reviews;

  const Doctordetailwidget(
      {super.key,
      required this.imagepath,
      required this.doctorName,
      required this.rating,
      required this.reviews,
      required this.specialty});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.37,
      width: width * 0.4,
      // color: Colors.red,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 5,
              color: const Color.fromARGB(255, 245, 249, 251),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(width * 0.14),
                topLeft: Radius.circular(width * 0.14),
                bottomLeft: Radius.circular(width * 0.03),
                bottomRight: Radius.circular(width * 0.03),
              )),
              child: SizedBox(
                height: height * 0.28,
                width: width * 0.38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.03,
                      width: width * 0.3,
                      //  color: Colors.amber,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.01),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: height * 0.15,
                width: width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.012,
                    ),
                    SizedBox(
                      height: height * 0.035,
                      width: width * 0.54,
                      // doctor name
                      child: Text(
                        "Dr. $doctorName",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                      width: width * 0.54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            specialty,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 88, 88, 88),
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: height * 0.04,
                            width: width * 0.1,
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                              size: width * 0.05,
                            ),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //     height: height * 0.025,
                    //     width: width * 0.1,
                    //     child: Icon(
                    //       Icons.arrow_forward,
                    //       size: width * 0.075,
                    //       color: Colors.grey.shade800,
                    //     )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.035,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(55, 37, 149, 190),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: width * 0.046,
                            color: Apptheme.mainbackgroundcolor,
                          ),
                          SizedBox(
                            width: width * 0.012,
                          ),
                          //rating of doctor
                          Text(
                            rating.toString(),
                            style: TextStyle(
                                color: Apptheme.mainbackgroundcolor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.034),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    //total reviews that the doctor got
                    Text(
                      "(${reviews.toString()} Reviews)",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: width * 0.034,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height * 0.18,
              width: width * 0.333,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight, image: AssetImage(imagepath))),
            ),
          )
        ],
      ),
      // color: Colors.black,
    );
  }
}
