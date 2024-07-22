import 'package:action_center_data_app/pages/notification_content.dart';
import 'package:action_center_data_app/tempData/dummy_data.dart';
import 'package:flutter/material.dart';

class NoticationPage extends StatefulWidget {
  const NoticationPage({super.key});

  @override
  State<NoticationPage> createState() => _NoticationPageState();
}

class _NoticationPageState extends State<NoticationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        //Title
        Container(
          padding: const EdgeInsets.only(left:10, right: 10, top: 10),
          child: Text(
            "Notifications",
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return NotificationContent(
                title: notifications[index]["title"] as String,
                content: notifications[index]["content"] as String,
                icon: notifications[index]["icon"] as IconData,
                color: notifications[index]["color"] as Color,
              );
            },
          ),
        ),
      ],
    );
  }
}
