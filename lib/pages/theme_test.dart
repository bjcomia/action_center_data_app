import 'package:action_center_data_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ThemeTest extends StatefulWidget {
  const ThemeTest({super.key});

  @override
  State<ThemeTest> createState() => _ThemeTestState();
}

class _ThemeTestState extends State<ThemeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface
        ),
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
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
        ),
      ),
    );
  }
}