import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  Future SIGNUP() async {
    if (CheckPassword()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.of(context).pushNamed('/');
    }
  }

  bool CheckPassword() {
    if (_passwordController.text.trim() ==
        _confirmpasswordcontroller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordcontroller.dispose();
  }

  Future LOGIN() async {
    Navigator.of(context).pushReplacementNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //adding the Backgroud that i have designed on figma
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/SignupPage.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            child: Container(
              padding: EdgeInsets.only(
                  //TODO: the textfields should increase to top
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: 35,
                  left: 35),
              child: SingleChildScrollView(
                child: Column(children: [
                  //Email TexField
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),

                  // the distance
                  SizedBox(
                    height: 14,
                  ),

                  //Password TextField
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),

                  SizedBox(
                    height: 14,
                  ),

                  //Confirm Password TextField
                  TextField(
                    controller: _confirmpasswordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Confirm password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //Sign UP Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: SIGNUP,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 80, left: 80, top: 17, bottom: 17),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 93, 144, 1),
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

                  SizedBox(height: 30),

                  GestureDetector(
                    onTap: LOGIN,
                    child: Padding(
                      padding: EdgeInsets.only(right: 80),
                      child: Text(
                        'I Already Have An Account !',
                        style: GoogleFonts.robotoCondensed(fontSize: 14),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
