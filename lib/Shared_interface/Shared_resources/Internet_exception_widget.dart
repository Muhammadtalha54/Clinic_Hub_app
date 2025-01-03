import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/get_utils.dart';

class Internet_exception_widget extends StatefulWidget {
  const Internet_exception_widget({super.key, required this.onpress});
  final VoidCallback onpress;

  @override
  State<Internet_exception_widget> createState() =>
      _Internet_exception_widgetState();
}

class _Internet_exception_widgetState extends State<Internet_exception_widget> {
  @override
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.cloud_off_outlined,
              color: Colors.red,
              size: width * 0.1,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: SizedBox(
              height: height! * 0.2,
              width: width! * 0.8,
              child: Center(
                child: Text(
                  'You are not connected to the internet to Signup or login you need an internet connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.05,
                  ),
                ),
              ),
            ),
          ),
          const CircularProgressIndicator(),
          SizedBox(
            height: height! * 0.05,
            width: width! * 0.2,
          ),
          Center(
            child: InkWell(
              onTap: widget.onpress,
              child: Card(
                elevation: 10,
                child: Container(
                  height: height * 0.08,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: Apptheme.mainbackgroundcolor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text("Retry",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
