import 'package:flutter/material.dart';
import 'Azkercounter/Azkercount.dart';
import 'HomeAzker.dart';

class navigat extends StatefulWidget {
  const navigat({Key? key}) : super(key: key);

  @override
  State<navigat> createState() => _navigatState();
}

class _navigatState extends State<navigat> {
  int currentindex = 1;
  List<Widget> screens = [
    const Azkercount(),
    const HomeAzker(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentindex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff06396b),
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage(
                  'images/imagespha.jpg',
                ),
                height: 25,
                width: 40,
              ),
              label: 'السبحه',
            ),
            const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('images/imagedoaa.jpg'),
                height: 25,
                width: 40,
              ),
              label: 'الاذكار',
            ),
          ],
        ),
      ),
    );
  }
}
