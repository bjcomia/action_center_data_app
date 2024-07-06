import 'package:action_center_data_app/pages/settings.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var items = [Colors.red, Colors.orange, Colors.yellow, Colors.blue];
  var imageNames = ["hahaha", "kanye", "heart", "heart2"];
  var titles = ["Benedict", "Grant", "Berlie", "Kris"];
  var subTitles = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel urna et dui dignissim elementum in id dolor. ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel urna et dui dignissim elementum in id dolor. ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel urna et dui dignissim elementum in id dolor. ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel urna et dui dignissim elementum in id dolor. "
  ];
  var carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
        child: Column(
          children: [
            //Search Bar
            GestureDetector(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
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
                        offset: const Offset(2.5, 5),
                      )
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
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
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const SettingsPage();
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.settings_outlined),
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //Report Button
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 350,
              // color: Theme.of(context).colorScheme.onPrimary,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: Theme.of(context).colorScheme.onPrimaryContainer,
                // boxShadow: [
                //   BoxShadow(
                //     color:
                //         Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                //     offset: const Offset(1, 5),
                //     blurRadius: 13,
                //     spreadRadius: 2,
                //   )
                // ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AvatarGlow(
                    animate: true,
                    startDelay: const Duration(milliseconds: 1000),
                    glowColor: Theme.of(context).colorScheme.tertiaryContainer,
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
                            offset: const Offset(1, 10),
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
                  const SizedBox(height: 25),
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
            // const SizedBox(
            //   height: 10,
            // ),

            //Article Title
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Articles",
                    style: TextStyle(
                        fontSize: 23,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const SettingsPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "See More ",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Article Carousel
            SizedBox(
              width: double.infinity,
              child: FlutterCarousel(
                items: [
                  for (int index = 0; index < items.length; index++)
                    Stack(children: [
                      //bg image
                      Container(
                        width: double.infinity,
                        height: 207,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage(
                                    'images/${imageNames[index]}.jpg'),
                                fit: BoxFit.fill),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .shadow
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              )
                            ]),
                      ),
                      Container(
                          height: 207,
                          // margin: EdgeInsets.only(left: 5, right: 5),
                          // child: Text("Color # ${index + 1}"),
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: const [0.3, 1.0],
                              colors: [
                                items[index].withOpacity(0),
                                Colors.black
                              ],
                            ),
                          ),
                          child: Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "${titles[index]}\n",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                TextSpan(
                                  text: subTitles[index],
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ])
                ],
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      carouselIndex = index;
                    });
                  },
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  height: 230,
                  showIndicator: false,
                  slideIndicator: CircularWaveSlideIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}