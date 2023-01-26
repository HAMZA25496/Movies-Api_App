import 'package:flutter/material.dart';
import 'package:movieuitest/search_liat.dart';


import 'screens/home_screen.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int  _currentIndex = 0;
  final screens = [


    MySearchList(),
    HomeScreen(),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/Media_library.png')
        )
      ),
    ),
    Container(
      decoration: BoxDecoration(
  image: DecorationImage(
  image: AssetImage('images/Dashboard.png'),
  ),
  ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: screens[_currentIndex],

      bottomNavigationBar: SizedBox(
      height: size.height * 0.10,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25.0),topRight:  Radius.circular(25.0)),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,

          backgroundColor: const Color(0xFF2e2739),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,

          items: const [
            BottomNavigationBarItem(
                icon: Padding(
                  padding:  EdgeInsets.only(bottom: 4.0),
                  child: ImageIcon(AssetImage('images/Dashboard.png')),
                ),
                label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Padding(
                    padding:  EdgeInsets.only(bottom: 2.0),
                    child: ImageIcon(AssetImage('images/Watch.png')
                    )
                ), label: 'Watch'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: ImageIcon(AssetImage('images/Media_library.png')),
                ), label: 'Media Library'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/More.png')), label: 'More'),

          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });

          },
        ),
      ),
    ),
    );
  }
}
