import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckinScreen extends StatefulWidget {
  const CheckinScreen({super.key});

  @override
  State<CheckinScreen> createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen> {
  Future LOGIN() async {
    Navigator.of(context).pushReplacementNamed('login');
  }

  Future SIGNUP() async {
    Navigator.of(context).pushReplacementNamed('signup');
  }

  @override
  Widget build(BuildContext context) {
    //this is the first page displayed in the monitor when you open the app
    //if there is no data
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(3, 0, 0, 35.51),
                width: 130,
                height: 138.99,
                child: Image.asset(
                  'assets/AppLogo/Logo.png',
                  width: 266,
                  height: 56,
                )),
            Container(
              margin: EdgeInsets.fromLTRB(4, 0, 9, 13.5),
              width: double.infinity,
              height: 116,
              child: Stack(
                children: [
                  Positioned(
                    left: 8,
                    top: 0,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 330,
                          height: 60,
                          child: Text(
                            'Welcome to The',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: Color(0xdb000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 56,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 346,
                          height: 60,
                          child: Text(
                            'Home of Football',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: Color(0xdb000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(4, 0, 0, 13),
              padding: EdgeInsets.fromLTRB(17, 8, 38.5, 14),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff1877f2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 19.5, 1),
                      width: 35,
                      height: 35,
                      child: Image.asset(
                        'assets/icons/FACEBOOK.png',
                        width: 266,
                        height: 56,
                      )),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: Text(
                        'Continue with facebook',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 4, 5),
              padding: EdgeInsets.fromLTRB(22, 13, 46.5, 12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 35.5, 1),
                      width: 32,
                      height: 32,
                      child: Image.asset(
                        'assets/icons/GOOGLE.png',
                        width: 266,
                        height: 56,
                      )),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                      child: Text(
                        'Continue with google',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 5, 5),
                child: Text(
                  'or',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: LOGIN,
              child: Container(
                margin: EdgeInsets.fromLTRB(42, 5, 51, 0),
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 93, 144),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Center(
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        height: 1.2125,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: SIGNUP,
              child: Container(
                margin: EdgeInsets.fromLTRB(42, 20, 51, 0),
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0x913c5d90),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Center(
                    child: Text(
                      'SIGN UP',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        height: 1.2125,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
