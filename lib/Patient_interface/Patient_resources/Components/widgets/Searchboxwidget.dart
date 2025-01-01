
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
// this is the search box with the fiter option used on 
//home screen and the alldoctor screen
class SearchBoxReusable extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onbuttonpress;

  const SearchBoxReusable({super.key,
   required this.controller, required this.hintText, required this.onbuttonpress,});

  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
       double width = MediaQuery.of(context).size.width;
   return Container(
      height: height * 0.07,
      width: width * 0.9,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.03)),
            child: SizedBox(
              height: height * 0.056,
              width: width * 0.7,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Apptheme.mainbackgroundcolor,
                    size: width * 0.065,
                  ),

                  // suffixIcon: IconButton(
                  //   icon: Icon(Icons.clear),
                  //   onPressed: onClear ??
                  //       () => controller.clear(), // Clear the text field
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.02),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 139, 139, 139),
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.02),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 0.5,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                onChanged: (value) {
                  //  print('Search Query: $value');
                },
              ),
            ),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.02)),
            child: Container(
              height: height * 0.06,
              width: width * 0.1,
              decoration: BoxDecoration(
                color: Apptheme.mainbackgroundcolor,
                borderRadius: BorderRadius.circular(width * 0.02),
              ),
              child: Center(
                child: IconButton(
                    onPressed: onbuttonpress,
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                      size: width * 0.05,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}