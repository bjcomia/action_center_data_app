// import 'dart:math';
// import 'package:action_center_data_app/pages/home_page.dart';
// import 'package:action_center_data_app/pages/main_page.dart';
// import 'package:action_center_data_app/pages/settings.dart';
// import 'package:action_center_data_app/pages/testbar.dart';
// import 'package:action_center_data_app/pages/theme_test.dart';
// import 'package:action_center_data_app/theme/custom_themes.dart';
// import 'package:action_center_data_app/pages/article_content_page.dart';
import 'package:action_center_data_app/pages/login_page.dart';
import 'package:action_center_data_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
// import 'package:action_center_data_app/pages/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginReal(),
      theme: Provider.of<ThemeProvider>(context).themeData, //FirstPage
    );
  }
}

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController emailAddress = TextEditingController();
//     final TextEditingController pass = TextEditingController();

//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: 300,
//           height: 500,
//           padding: const EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//               border: Border.all(color: const Color.fromARGB(255, 0, 0, 0))),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: emailAddress,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(
//                     label: Text('Username'),
//                     labelStyle: TextStyle(color: Colors.red)),
//               ),
//               TextField(
//                 controller: pass,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(label: Text('Password')),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 30),
//               FilledButton(
//                   onPressed: () {
//                     print(emailAddress.text.trim());
//                     print(pass.text.trim());
//                   },
//                   child: const Text('Print Both'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
