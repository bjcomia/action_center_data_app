import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
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
                          isOn = !isOn;
                        });
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                      icon: isOn ? const Icon(Icons.toggle_on) : const Icon(Icons.toggle_off))
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 380,
              height: 500,
              // decoration: BoxDecoration(color: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    width: 120,
                    height: 120,
                    child: Image.asset('images/acdaLogo.png'),
                  ),
        
                  // const SizedBox(height: 10),
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          'BatStateu',
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
          onPressed: () {}, //Logout Function
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}
