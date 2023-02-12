import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'FavoriteTeams.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';
import 'CalandarScreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {



    var currentIndex = 0;



       List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.calendar_month,
    Icons.person_rounded,
  ];



 

  final List<Widget> _screens=[
    HomeScreen(),
    FavoriteScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
       bottomNavigationBar: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex=index;
          });
        },
        currentIndex: currentIndex,
        items: const [
        BottomNavigationBarItem(icon:Icon(Icons.home),
        label: 'Home'),


        BottomNavigationBarItem(icon:Icon(Icons.favorite_border),
        label: 'Favorite'),

        BottomNavigationBarItem(icon:Icon(Icons.calendar_month),
        label: 'Calendar'),

        BottomNavigationBarItem(icon:Icon(Icons.person_rounded),
        label: 'Profile')

       ],
       
       fixedColor: Color.fromRGBO(47, 173, 251,1),
       )
        
    );
  }
}