import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
/* This screen contains all the privacy policy for the app and is shared by the 
doctor and the patient

 */
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define MediaQuery for responsive design
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Apptheme.appbodybackgroundcolor,
        title: Text(
          'Privacy Policy',
          style: TextStyle(fontSize: width * 0.05),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                'Introduction',
                'This privacy policy explains how we handle your personal information when you use our doctor booking app. By using the app, you agree to the terms described in this policy.',
                width,
                height,
              ),
              SizedBox(height: height * 0.03),
              _buildSection(
                'Data Collection',
                'We collect your personal details such as name, contact number, and appointment preferences to facilitate booking and communication. All data is handled securely.',
                width,
                height,
              ),
              SizedBox(height: height * 0.03),
              _buildSection(
                'Data Usage',
                'Your information is used solely for appointment booking, reminders, and providing medical services. We do not share your data with third parties without your consent.',
                width,
                height,
              ),
              SizedBox(height: height * 0.03),
              _buildSection(
                'Data Security',
                'We implement strict measures to protect your data from unauthorized access. Our systems use encryption to ensure data safety.',
                width,
                height,
              ),
              SizedBox(height: height * 0.03),
              _buildSection(
                'Your Rights',
                'You have the right to access, modify, or delete your personal information. Contact our support team for assistance.',
                width,
                height,
              ),
              SizedBox(height: height * 0.03),
              _buildSection(
                'Changes to Policy',
                'We may update this privacy policy periodically. Notifications about updates will be sent to registered users.',
                width,
                height,
              ),
              SizedBox(height: height * 0.03),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'If you have any questions about this privacy policy, please contact us at support@doctorapp.com.',
                style: TextStyle(fontSize: width * 0.04),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      String heading, String body, double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: height * 0.01),
        Text(
          body,
          style: TextStyle(fontSize: width * 0.04),
        ),
      ],
    );
  }
}
