import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
/*This screen shows the user his previous  completed 
appointments with various doctors
 */
class AppointmentHistoryScreen extends StatefulWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  State<AppointmentHistoryScreen> createState() =>
      _AppointmentHistoryScreenState();
}

class _AppointmentHistoryScreenState extends State<AppointmentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final appointments = [
      {'date': '2023-06-15', 'doctor': 'Dr. Smith', 'specialty': 'Cardiology'},
      {
        'date': '2023-05-20',
        'doctor': 'Dr. Johnson',
        'specialty': 'Dermatology'
      },
      {
        'date': '2023-04-10',
        'doctor': 'Dr. Williams',
        'specialty': 'Neurology'
      },
      {
        'date': '2023-04-10',
        'doctor': 'Dr. Williams',
        'specialty': 'Neurology'
      },
    ];

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Apptheme.appbodybackgroundcolor,
        title: Text(
          'Previous Appointments',
          style: TextStyle(fontSize: width * 0.05),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: height,
          width: width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                'Your recent appointments',
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SizedBox(
                  height: height,
                  width: width * 0.9,
                  child: Column(
                    children: [
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                        },
                        border: TableBorder.all(color: Colors.grey),
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(color: Colors.grey),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(width * 0.02),
                                child: Text('Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.04)),
                              ),
                              Padding(
                                padding: EdgeInsets.all(width * 0.02),
                                child: Text('Doctor',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.04)),
                              ),
                              Padding(
                                padding: EdgeInsets.all(width * 0.02),
                                child: Text('Specialty',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.04)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                            },
                            border: TableBorder.all(color: Colors.grey),
                            children: appointments
                                .map((appointment) => TableRow(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: Text(appointment['date']!,
                                              style: TextStyle(
                                                  fontSize: width * 0.035)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: Text(appointment['doctor']!,
                                              style: TextStyle(
                                                  fontSize: width * 0.035)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: Text(appointment['specialty']!,
                                              style: TextStyle(
                                                  fontSize: width * 0.035)),
                                        ),
                                      ],
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
