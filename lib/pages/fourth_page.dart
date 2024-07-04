import 'package:flutter/material.dart';
import 'package:action_center_data_app/pages/third_page.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berlie'),
        backgroundColor: const Color.fromARGB(255, 0, 255, 38),
      ),
      body: Container(
        color: Colors.amber,
        width: 200,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context){
                    return const ThirdPage();
                  })
                );
              } 
            , child: const Text('Benedict'))
          ],
        ),
      ),      
    );
  }
}