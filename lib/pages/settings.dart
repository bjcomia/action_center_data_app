import 'package:action_center_data_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isOff = false;

  @override
  void initState() {
    super.initState();
    _loadSettings(); // Load the saved settings when the page is initialized
  }

  // Load the saved settings
  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        isOff = prefs.getBool('isOff') ??
            false; // If the value doesn't exist, return false
      },
    );
  }

  // Save the settings
  void _saveSettings(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isOff', value); // Save the new value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enable Dark Mode',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16),
                    ),
                    IconButton(
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            isOff = !isOff; // Toggle the isOff value
                          });
                          _saveSettings(isOff); // Save the new state
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(); // Toggle the theme
                        },
                        icon: isOff
                            ? const Icon(Icons.toggle_on)
                            : const Icon(Icons.toggle_off))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 380,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      width: 120,
                      height: 120,
                      child: Image.asset('images/acdaLogo.png'),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            'BatStateU',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Action Center Data App',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'An Incident Reporting App',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            'Developers',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Comia, Benedict John D.\nGarcia, Berlie Jaye T. \nObiedo, Grant Thomas G.',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 40),
              foregroundColor: Theme.of(context).colorScheme.tertiary,
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          onPressed: () async {
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
          }, // Logout Function
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}
