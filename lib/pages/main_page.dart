import 'package:action_center_data_app/pages/login_page.dart';
import 'package:action_center_data_app/pages/main_home_page.dart';
import 'package:action_center_data_app/pages/main_notification_page.dart';
import 'package:action_center_data_app/pages/report_form.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var mainPages = [const HomeScreen(), const NotificationPage()];
  var currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop == true) {
          return;
        }
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          title: "Logout",
          text: "Are you sure you want to logout?",
          headerBackgroundColor: Theme.of(context).colorScheme.primary,
          customAsset: 'images/question2.gif',
          confirmBtnText: 'Yes',
          cancelBtnText: 'No',
          confirmBtnColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          titleColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.secondary,
          onConfirmBtnTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginReal()),
                (Route<dynamic> route) => false);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,

        //Screens
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
                    return const ReportForm();
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
          unselectedItemColor: Theme.of(context)
              .colorScheme
              .onSecondaryContainer
              .withOpacity(0.7),
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
              icon: Badge(
                isLabelVisible: true,
                label: Text("3"),
                child: Icon(Icons.notifications),
              ),
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
      ),
    );
  }
}
