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
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/firstpage.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  // LOGIN button

                  Padding(
                    padding: EdgeInsets.only(top: 345),
                    child: GestureDetector(
                      onTap: LOGIN,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 80, left: 80, top: 17, bottom: 17),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 60, 94, 144),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 17),

                  // SIGN UP button

                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: GestureDetector(
                      onTap: SIGNUP,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 75, left: 75, top: 17, bottom: 17),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(220, 60, 94, 144),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        
                        GestureDetector(
                          // TODO: onTap function
                          child: Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(24, 119, 242, 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 6.0,
                                    )
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/FACEBOOK.png'))),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.only(right: 70),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 6.0,
                                    )
                                  ],
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/icons/GOOGLE.png'),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
