import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
/*This page shows the information about the app and the faqs in the expansiontiles
used by both the patient and the doctor

 */
class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define MediaQuery for responsive design
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Apptheme.appbodybackgroundcolor,
        title: Text(
          'About Us',
          style: TextStyle(fontSize: screenWidth * 0.05),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Our App',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Our app is designed to make clinic booking easier and more accessible for everyone. With just a few taps, you can book appointments with your preferred doctors and manage your medical schedules efficiently.',
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Email: support@clinicapp.com\nPhone: +123 456 7890\nAddress: 123 Health Street, Wellness City',
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'FAQs',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  return FaqTile(
                    question: faqs[index]['question']!,
                    answer: faqs[index]['answer']!,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqTile extends StatelessWidget {
  final String question;
  final String answer;
  final double screenWidth;
  final double screenHeight;

  const FaqTile({
    required this.question,
    required this.answer,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.01,
          ),
          child: Text(
            answer,
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
        ),
      ],
    );
  }
}

// Sample FAQs data
final List<Map<String, String>> faqs = [
  {
    'question': 'How do I book an appointment?',
    'answer':
        'To book an appointment, navigate to the bookings section, select a doctor, and choose an available time slot.',
  },
  {
    'question': 'Can I cancel or reschedule an appointment?',
    'answer':
        'Yes, you can cancel or reschedule an appointment from the My Appointments section before the appointment time.',
  },
  {
    'question': 'Is my data secure?',
    'answer':
        'Yes, we prioritize your privacy and use secure systems to protect your data.',
  },
  {
    'question': 'How do I contact customer support?',
    'answer':
        'You can contact us via email at support@clinicapp.com or call us at +123 456 7890.',
  },
];
