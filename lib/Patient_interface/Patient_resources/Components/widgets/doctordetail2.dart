import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';

// this is the doctor detail widget which shows essential details of the doctor
// to the pateint and is used on the patient home screen/ favourite screen
class Doctordetailwidget2 extends StatelessWidget {
  final String imagepath, doctorName, specialty;
  final double rating, reviews;

  const Doctordetailwidget2({
    super.key,
    required this.imagepath,
    required this.doctorName,
    required this.rating,
    required this.reviews,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.2,
      width: width,
      //  color: Colors.red,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              color: Colors.white,
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.015
                    // topLeft: Radius.circular(width * 0.05),
                    // topRight: Radius.circular(width * 0.05),
                    // bottomLeft: Radius.circular(width * 0.025),
                    // bottomRight: Radius.circular(width * 0.025),
                    ),
              ),
              child: SizedBox(
                height: height * 0.2,
                width: width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imagepath == null
                        ? Container(
                            height: height * 0.17,
                            width: width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          )
                        : Container(
                            height: height * 0.17,
                            width: width * 0.23,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(imagepath))),
                          ),
                    Container(
                      height: height * 0.15,
                      width: width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: height * 0.012,
                          ),
                          SizedBox(
                            height: height * 0.035,
                            width: width * 0.54,
                            // doctor name
                            child: Text(
                              "Dr.$doctorName",
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
                                      color:
                                          const Color.fromARGB(255, 88, 88, 88),
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w500),
                                ),
                                // SizedBox(
                                //   height: height * 0.04,
                                //   width: width * 0.1,
                                //   child: Icon(
                                //     Icons.favorite_outline,
                                //     color: Colors.red,
                                //     size: width * 0.05,
                                //   ),
                                // )
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
                            height: height * 0.025,
                          ),
                          SizedBox(
                            height: height * 0.035,
                            width: width * 0.5,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: height * 0.035,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          55, 37, 149, 190),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              color:
                                                  Apptheme.mainbackgroundcolor,
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
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // color: Colors.black,
    );
  }
}
