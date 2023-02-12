import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:livesoccer/AppBar_icons/AddFavorite.dart';
import 'package:livesoccer/Fragments/CalandarScreen.dart';
import 'package:livesoccer/Fragments/FavoriteTeams.dart';
import 'package:livesoccer/Fragments/ProfileScreen.dart';
import 'package:livesoccer/Fragments/TabScreen.dart';
import 'package:livesoccer/screens/Authentification.dart';
import 'package:livesoccer/screens/ForgotPage.dart';
import 'package:livesoccer/screens/LoginScreen.dart';
import 'package:livesoccer/screens/Signup_Page.dart';

import 'Fragments/HomeScreen.dart';
import 'screens/CheckinScreen.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => Authentification(),
      'forgot': (context) => ForgotScreen(),
      'home': (context) => HomeScreen(),
      'signup': (context) => SignupScreen(),
      'login': (context) => LoginScreen(),
      'check':(context) => CheckinScreen(),
      'favorite':(context) => FavoriteScreen(),
      'profile':(context) => ProfileScreen(),
      'calendar':(context) => CalendarScreen(),
      'tabscreen':(context) => TabScreen(),
      'addfavorite':(context) => AddFavorite()
    },
  ));
}
