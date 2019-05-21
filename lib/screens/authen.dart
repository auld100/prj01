import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showTitle(String nText, double nFsize) {
    return Text(
      nText,
      style: TextStyle(
          fontSize: nFsize,
          fontWeight: FontWeight.bold,
          color: Colors.green[700]),
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo1.png');
  }

  Widget showUser() {
    return TextFormField(
      decoration: InputDecoration(labelText: "USER: ", hintText: "Username"),
    );
  }

  Widget showPassword() {
    return TextField(
      decoration:
          InputDecoration(labelText: "PASSWORD: ", hintText: "Password"),
      obscureText: true,
    );
  }

  Widget showSignUp() {
    return RaisedButton(
      child: Text("Sign UP"),
      color: Colors.orangeAccent[100],
      onPressed: () {},
    );
  }

  Widget showSignIn() {
    return RaisedButton(
      child: Text("Sign In"),
      color: Colors.lightGreen[100],
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.tealAccent[100], Colors.white],
                    begin: Alignment(0, 1))),
            padding: EdgeInsets.only(top: 70.0),
            alignment: Alignment(0, 0),
            child: Column(
              children: <Widget>[
                showLogo(),
                //showTitle("", 16.0),
                Container(
                  margin: EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: showTitle("User Authentication", 28.0),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 0, right: 15),
                  child: showUser(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 0, right: 15),
                  child: showPassword(),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                    alignment: Alignment(0, 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: showSignIn(),
                        ),
                        Expanded(
                          child: showSignUp(),
                        )
                      ],
                    ))
                //showTitle("", 16.0)
              ],
            )));
  }
}
