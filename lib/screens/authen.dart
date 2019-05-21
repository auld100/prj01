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
      decoration: InputDecoration(labelText: "User: ", hintText: "Username"),
    );
  }

  Widget showPassword() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Password: ", hintText: "Password"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 70.0),
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
                )

                //showTitle("", 16.0)
              ],
            )));
  }
}
