import 'package:flutter/material.dart';

import 'SignUpPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.green[200]],
          begin: const FractionalOffset(0.0, 1.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Text(" BOLG APP",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Great stories for grate people !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: boxContainer("assets/google.png", "Sign up with Google",null),
              ),
              SizedBox(
                height: 20,
              ),
              boxContainer("assets/facebook.png", "Sign up with Facebook",null),
              SizedBox(
                height: 20,
              ),
              boxContainer("assets/email.png", "Sign up with Email",onEmailclick),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Already have an account ! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "SIGN IN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.green, 
                  ),
                ),
              ])
            ],
          )),
    ));
  }
onEmailclick(){
  Navigator.of(context).push(MaterialPageRoute(builder :(context) =>
  SignUpPage(),));
}
  Widget boxContainer(String path, String text ,onclick) {
    return Card(
      child: InkWell(
        onTap:onclick,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 140,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                path,
                height: 20,
                width: 20,
              ),
              SizedBox(width: 10),
              Text(text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
