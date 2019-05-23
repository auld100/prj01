import 'package:flutter/material.dart';
import 'package:prj01/screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  String user, password;

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
      validator: (String value) {
        if (value.length == 0) {
          return "Please fill in your username";
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  Widget showPassword() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "PASSWORD: ", hintText: "Password"),
      validator: (String value) {
        if (value.length <= 5) {
          return "Password should be more then 5 characters.";
        }
      },
      obscureText: true,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget showSignUp(BuildContext context) {
    return RaisedButton(
      child: Text("Sign UP"),
      color: Colors.orangeAccent[100],
      onPressed: () {
        //print("You Click SignUp");

        // Create Router
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showSignIn() {
    return RaisedButton(
      child: Text("Sign In"),
      color: Colors.lightGreen[100],
      onPressed: () {
        print("You Click SignIn");
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("SignIn OK");
          checkUserAndPassword();
        }
      },
    );
  }

  void checkUserAndPassword() async {
    String urlPHP =
        'http://www.androidthai.in.th/tid/getUserWhereUserMaster.php?isAdd=true&User=$user';
    var response = await get(urlPHP);
    var resultString = json.decode(response.body);
    print('resultString ==> $resultString');
    if (resultString['Password'].toString() == password.toString()) {
      //Create POP
      print("login ok.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: formKey,
        child: Container(
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
                        child: showSignUp(context),
                      )
                    ],
                  ))
              //showTitle("", 16.0)
            ],
          ),
        ),
      ),
    );
  }
}
