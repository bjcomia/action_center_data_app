import 'package:flutter/material.dart';

class BotTest extends StatefulWidget {
  const BotTest({super.key});

  @override
  State<BotTest> createState() => _BotTestState();
}

class _BotTestState extends State<BotTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks - Bottom App Bar')),
      body: Container(
        // decoration: BoxDecoration(color: Color.fromARGB(255, 30, 30, 30)),
      ),
      floatingActionButton: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white, width: 6)),
        child: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red[900],
          shape: const CircleBorder(),
          child: const Icon(Icons.crisis_alert, size: 40,),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red[900],
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
