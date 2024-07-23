import 'package:flutter/material.dart';
import 'package:action_center_data_app/pages/notification_content.dart';
import 'package:action_center_data_app/tempData/dummy_data.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Container(
            height: 80,
            // color: Colors.brown,
            alignment: Alignment.bottomCenter,
            child: Text(
              "Notifications",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: notifications.isEmpty
                ? _buildEmptyState(context)
                : _buildNotificationList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off,
            size: 80,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            "No notifications yet",
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationContent(
          title: notifications[index]["title"] as String,
          content: notifications[index]["content"] as String,
          icon: notifications[index]["icon"] as IconData,
          color: notifications[index]["color"] as Color,
        );
      },
    );
  }
}
