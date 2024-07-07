import 'package:action_center_data_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class LoginReal extends StatefulWidget {
  const LoginReal({super.key});

  @override
  State<LoginReal> createState() => _LoginRealState();
}

class _LoginRealState extends State<LoginReal> {
  final formGlobalKey = GlobalKey<FormState>();
  String emailFinal = '';
  String passFinal = '';

  var togglePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: 130,
                height: 130,
                child: Image.asset('images/acdaLogo.png'),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      'Enter your BatStateU Information to enter the app',
                      style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.secondary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(35.0),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          label: Text(
                            'Username',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailFinal = value!;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary)
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        obscureText: togglePass,
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  togglePass = !togglePass;
                                });
                              },
                              icon: togglePass
                                  ? Icon(Icons.visibility, color: Theme.of(context).colorScheme.secondary)
                                  : Icon(Icons.visibility_off, color: Theme.of(context).colorScheme.secondary,)),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          label: Text(
                            'Password',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          passFinal = value!;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 40),
                            foregroundColor:
                                Theme.of(context).colorScheme.tertiary,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            // print('$emailFinal, $passFinal');
                            formGlobalKey.currentState!.reset();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const MainPage();
                            }));
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text.rich(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 13,
                        ),
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'By clicking login, you agree to our '),
                            TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' and '),
                            TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
