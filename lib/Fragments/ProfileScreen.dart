import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:livesoccer/screens/CheckinScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  void signout() async {
    FirebaseAuth.instance.signOut();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckinScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.only(left: 90, top: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("signed in as : " + user.email!),
          SizedBox(height: 30),
          GestureDetector(
            onTap: signout,
            child: Container(
              padding:
                  EdgeInsets.only(right: 80, left: 80, top: 17, bottom: 17),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 93, 144, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'sign out',
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
