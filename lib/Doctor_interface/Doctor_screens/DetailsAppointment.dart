// import 'package:flutter/material.dart';
// //this is the screen on which the appointment details will be displayed when the
// //doctor will click the appointment card this will get the details in parameters
// class DetailAppoitmentscreen extends StatelessWidget {
//   final Map<String, String> appointmentDetails;
//   final int index;

//   const DetailAppoitmentscreen({
//     Key? key,
//     required this.appointmentDetails,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print(appointmentDetails['PatientImageUrl']);
//     // Screen dimensions
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointment Details',
//             style:
//                 TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: SizedBox(
//             height: height,
//             width: width * 0.8,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: CircleAvatar(
//                     radius: width * 0.2,
//                     backgroundImage:
//                         AssetImage(appointmentDetails['image'] ?? ''),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.03),
//                 Text('Patient Name:',
//                     style: TextStyle(
//                         fontSize: width * 0.045, fontWeight: FontWeight.w600)),
//                 Text(appointmentDetails['PatientName'] ?? '',
//                     style: TextStyle(fontSize: width * 0.04)),
//                 SizedBox(height: height * 0.02),
//                 Text('Problem:',
//                     style: TextStyle(
//                         fontSize: width * 0.045, fontWeight: FontWeight.w600)),
//                 Text(appointmentDetails['Patientproblem'] ?? '',
//                     style: TextStyle(fontSize: width * 0.04)),
//                 SizedBox(height: height * 0.02),
//                 Text('Date:',
//                     style: TextStyle(
//                         fontSize: width * 0.045, fontWeight: FontWeight.w600)),
//                 Text(appointmentDetails['date'] ?? '',
//                     style: TextStyle(fontSize: width * 0.04)),
//                 SizedBox(height: height * 0.02),
//                 Text('Time:',
//                     style: TextStyle(
//                         fontSize: width * 0.045, fontWeight: FontWeight.w600)),
//                 Text(appointmentDetails['time'] ?? '',
//                     style: TextStyle(fontSize: width * 0.04)),
//                 SizedBox(height: height * 0.02),
//                 Text('Appointment ID:',
//                     style: TextStyle(
//                         fontSize: width * 0.045, fontWeight: FontWeight.w600)),
//                 Text(appointmentDetails['id'] ?? '',
//                     style: TextStyle(fontSize: width * 0.04)),
//                 //  const Spacer(),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context, 'Appointment Cancelled');
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       padding: EdgeInsets.symmetric(
//                           vertical: height * 0.015, horizontal: width * 0.2),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(width * 0.02)),
//                     ),
//                     child: Text('Cancel Appointment',
//                         style: TextStyle(
//                             fontSize: width * 0.03, color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
