import 'package:flutter/material.dart';
/*All the notifications that the user will receive
 will be displayed in this screen
 */

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      'sender': 'Admin',
      'message': 'Your appointment is confirmed.',
      'date': DateTime.now(),
      'read': false,
    },
    {
      'sender': 'Admin',
      'message': 'Your appointment is confirmed.',
      'date': DateTime.now(),
      'read': false,
    },
    {
      'sender': 'Admin',
      'message': 'Your appointment is confirmed.',
      'date': DateTime.now(),
      'read': false,
    },
    {
      'sender': 'Doctor',
      'message': 'Please bring your previous reports.',
      'date': DateTime.now().subtract(Duration(days: 1)),
      'read': true,
    },
    {
      'sender': 'Doctor',
      'message': 'Please bring your previous reports.',
      'date': DateTime.now().subtract(Duration(days: 5)),
      'read': true,
    },
    // Add more notifications here
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          bool isUnread = !notifications[index]['read'];
          DateTime notificationDate = notifications[index]['date'];
          bool isToday = notificationDate.day == DateTime.now().day &&
              notificationDate.month == DateTime.now().month &&
              notificationDate.year == DateTime.now().year;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0 ||
                  notifications[index - 1]['date'].day != notificationDate.day)
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.05),
                  child: Text(
                    isToday
                        ? 'Today'
                        : '${notificationDate.toLocal()}'.split(' ')[0],
                    style: TextStyle(
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              Card(
                elevation: 5,
                color: isUnread
                    ? Colors.blue[50]
                    : const Color.fromARGB(255, 255, 250, 250),
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.005,
                    horizontal: screenWidth * 0.05),
                child: ListTile(
                  title: Text(notifications[index]['sender']),
                  subtitle: Text(notifications[index]['message']),
                  trailing: isUnread
                      ? Icon(Icons.markunread)
                      : Icon(
                          Icons.done_all,
                          color: Colors.blue,
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
