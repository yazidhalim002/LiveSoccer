import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    //TODO:check the timer of the circularProgress

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Navigator.of(context).pushNamed('tabscreen');
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'WARNING!',
          message: 'the email or the password may incorrect',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      Navigator.of(context).pushReplacementNamed('login');
    }
  }

  void openSignupScreen() {
    Navigator.of(context).pushReplacementNamed('signup');
  }

  void ForgotPasswordScreen() {
    Navigator.of(context).pushReplacementNamed('forgot');
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //adding the Backgroud that i have designed on figma
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/LoginPage.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: 35,
                  left: 35),
              child: SingleChildScrollView(
                child: Column(children: [
                  //Email TexField
                  TextField(
                    controller: emailController,
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 80, left: 80, top: 17, bottom: 17),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 93, 144, 1),
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

                  SizedBox(height: 20),

                  //forgot password

                  Row(
                    children: [
                      GestureDetector(
                          onTap: ForgotPasswordScreen,
                          child: Text('Forgot Password ?',
                              style: GoogleFonts.robotoCondensed())),
                    ],
                  ),

                  SizedBox(height: 6),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: openSignupScreen,
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.robotoCondensed(
                            color: Color.fromRGBO(60, 93, 144, 1),
                          ),
                        ),
                      )
                    ],
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
