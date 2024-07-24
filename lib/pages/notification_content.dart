import 'package:flutter/material.dart';

class NotificationContent extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;

  const NotificationContent({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(2.5, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
