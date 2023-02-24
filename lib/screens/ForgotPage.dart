import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();

  void dipose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Future LOGIN() async {
    Navigator.of(context).pushReplacementNamed('login');
  }

  Future ResetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    //TODO:check the timer of the circularProgress

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());

      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Well done!',
          message: 'the mail sent successful',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      Navigator.of(context).pushReplacementNamed('login');
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oops!',
          message: 'the email doesn\'t Sign up',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      Navigator.of(context).pushReplacementNamed('forgot');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/ForgotPage.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 30),
            child: GestureDetector(
              onTap: LOGIN,
              child: Container(
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  size: 38,
                ),
                padding: EdgeInsets.only(left: 13, top: 10),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0x9e3c5d90),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
              child: Container(
                  padding: EdgeInsets.only(top: 450, right: 35, left: 35),
                  child: Column(children: [
                    //Email TexField

                    TextFormField(
                      controller: emailcontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'enter a valid email'
                              : null,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),

                    SizedBox(height: 20),

                    // send mail button

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: ResetPassword,
                        child: Container(
                          padding: EdgeInsets.only(
                              right: 80, left: 80, top: 17, bottom: 17),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(60, 93, 144, 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Reset Password',
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])))
        ]),
      ),
    );
  }
}
