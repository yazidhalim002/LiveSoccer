import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livesoccer/Fragments/TabScreen.dart';
import 'package:livesoccer/screens/CheckinScreen.dart';



class Authentification extends StatelessWidget {
  const Authentification({super.key});

  @override
  Widget build(BuildContext context) {
    // here we check if the user have already loged in or not
    // if yes the app will open directly in HomeScreen
    // if not the app will display the LoginScreen first
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData)
            return TabScreen();
          else
          return CheckinScreen();
        },
      ),
    );
  }
}
