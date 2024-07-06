import 'package:action_center_data_app/pages/settings.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      // color: Theme.of(context).colorScheme.onPrimaryContainer,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderRadius: const BorderRadius.all(
                        Radius.elliptical(30, 30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(2.5, 5),
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.settings_outlined,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //report button
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 350,
                // color: Theme.of(context).colorScheme.onPrimary,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                      offset: Offset(1, 5),
                      blurRadius: 13,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AvatarGlow(
                      animate: true,
                      startDelay: const Duration(milliseconds: 1000),
                      glowColor:Theme.of(context).colorScheme.tertiaryContainer,
                      glowShape: BoxShape.circle,
                      glowRadiusFactor: 0.12,
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .shadow
                                  .withOpacity(0.5),
                              offset: Offset(1, 10),
                              blurRadius: 13,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.crisis_alert,
                            size: 140,
                          ),
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Tap Here to Report an Incident",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                color: Colors.amber,
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.blue,
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),

      //Incident Report Shortcut
      floatingActionButton: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer, width: 6)),
        child: FloatingActionButton(
          foregroundColor: Theme.of(context).colorScheme.tertiary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.crisis_alert,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return SettingsPage();
            }));
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
          setState(() {
            currIndex = index;
          });
        },
      ),
    );
  }
}
