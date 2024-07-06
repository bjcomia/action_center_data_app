import 'package:action_center_data_app/pages/main_home_page.dart';
import 'package:action_center_data_app/pages/main_notification_page.dart';
import 'package:action_center_data_app/pages/settings.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var mainPages = [const HomeScreen(), const NoticationPage()];
  var currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: mainPages[currIndex],

      //Incident Report Shortcut
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 6)),
        child: FloatingActionButton(
          foregroundColor: Theme.of(context).colorScheme.tertiary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.crisis_alert,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const SettingsPage(); //CHANGE TO REPORTFORM!
                },
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Bottom Nav Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.7),
        selectedItemColor: Theme.of(context).colorScheme.tertiaryContainer,
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
        currentIndex: currIndex,
        onTap: (int index) {
          setState(
            () {
              currIndex = index;
            },
          );
        },
      ),
    );
  }
}
