import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool vis = true;
  final _globalKey = GlobalKey<FormState>();

 
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
          )),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "sign up with email",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                usernameTextField(),
                emailTextField(),
                passwordTextField(),
                InkWell(
                  onTap: () {
                    if (_globalKey.currentState.validate()) {
                      print("Validated");
                    }
                  },
                  child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff09A86B),
                      ),
                      child: Center(
                        child: Text("Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                )
              ],
            ),
          )),
    );
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(children: [
        Text("User Name : "),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) return "User name can't be empty !";
            return null;
          },
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            )),
          ),
        )
      ]),
    ); 
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(children: [
        Text("Email : "),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) return "User email can't be empty !";
            if (!value.contains("@")) return "Invalid email !";
            return null;
          },
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            )),
          ),
        )
      ]),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(children: [
        Text("Password : "),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) return "User password can't be empty !";
            if (value.length <= 8)
              return "Password length should be higher than 8 !";
            return null;
          },
          obscureText: vis,
          decoration: InputDecoration(
            suffixIcon: IconButton( icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  vis = !vis;
                });
              },
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            )),
          ),
        )
      ]),
    );
  }
}
