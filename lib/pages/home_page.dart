import 'package:flutter/material.dart';
import 'package:action_center_data_app/pages/camera.dart';
import 'package:action_center_data_app/pages/third_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String btnName = 'Click';
  String titleName = 'Home';
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.red,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.amber),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/kanye.jpg'),
                ),
                currentAccountPictureSize: Size.square(65),
                accountName: Text(
                  'Kanye West',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                accountEmail: Text('kanye@gmail.com',
                    style: TextStyle(color: Colors.black)),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Container(
                //       height: 80,
                //       width: 80,
                //       child: const CircleAvatar(
                //         radius: 48,
                //         backgroundImage: AssetImage('images/kanye.jpg'),
                //       ),
                //     ),
                //     Text(
                //       'Kanye West',
                //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                //     ),
                //   ],
                // ),
              ),
            ),
            ListTile(
              iconColor: Colors.blue,
              hoverColor: Colors.black12,
              enabled: true,
              leading: const Icon(Icons.back_hand),
              title: const Text('HAHAHAH'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              enabled: true,
              leading: const Icon(Icons.ac_unit),
              title: const Text('HAHBDFSJAFBK'),
              onTap: () {
                Navigator.pop(context);
              }
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xfff8f8f8),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 2.0,
        child: const Icon(Icons.camera),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text(titleName),
          backgroundColor: const Color.fromARGB(255, 255, 146, 146)),
      body: Center(
        child: currIndex == 0
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(255, 186, 196, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 211, 235, 255),
                        foregroundColor: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const CameraPage(); //Go To second Page
                          }),
                        );
                      },
                      child: const Text('SEC'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          btnName == 'Clicked'
                              ? btnName = 'Click'
                              : btnName = 'Clicked';
                        });
                      },
                      child: Text(btnName),
                    ),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/kanye.jpg'),
                    SizedBox(
                      child: SizedBox(
                        height: 180,
                        width: 180,
                        child: Image.network(
                            'https://static8.depositphotos.com/1054619/930/v/450/depositphotos_9305298-stock-illustration-i-love-you.jpg'),
                      ),
                    ),
                    ElevatedButton(
                        child: const Text('Go to Third Page'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const ThirdPage();
                          }));
                        }),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(231, 255, 153, 1),
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Nyehehe',
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: 'HAHAHAH',
            icon: Icon(Icons.event_seat),
          ),
          BottomNavigationBarItem(
            label: 'tie',
            icon: Icon(Icons.ac_unit_sharp),
          ),
        ],
        currentIndex: currIndex,
        onTap: (int index) {
          setState(() {
            currIndex = index;
            if (currIndex == 0) {
              titleName = 'Home';
            } else if (currIndex == 1) {
              titleName = 'Hi BB koo!!';
            } else if (currIndex == 2) {
              titleName = 'Nigga!!';
            }
          });
        },
      ),
    );
  }
}
