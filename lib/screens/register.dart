import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String valName, valUser, valPasswd;

  Widget registerButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        //print('You Click Register');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("name = $valName, user = $valUser, password = $valPasswd");
          uploadValueToServer(context);
        }
      },
    );
  }

  void uploadValueToServer(BuildContext context) async {
    String urlPHP =
        'https://www.androidthai.in.th/tid/addUserUng.php?isAdd=true&Name=$valName&User=$valUser&Password=$valPasswd';
    var response = await get(urlPHP);
    var resultString = json.decode(response.body);
    print('resultString ==> $resultString');
    if (resultString.toString() == 'true') {
      //Create POP
      Navigator.of(context).pop();
    }
  }

  Widget nameTextFromField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Name :', hintText: 'Type Your Name'),
      validator: (String value) {
        if (value.length == 0) {
          return "Please fill in your name.";
        }
      },
      onSaved: (String value) {
        valName = value;
      },
    );
  }

  Widget userTextFromField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'User :', hintText: 'Type Your User'),
      validator: (String value) {
        if (value.length == 0) {
          return "Please fill in your username.";
        }
      },
      onSaved: (String value) {
        valUser = value;
      },
    );
  }

  Widget passwordTextFromField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password :', hintText: 'More 6 Charator'),
      validator: (String value) {
        if (value.length == 0) {
          return "Please fill in your password.";
        } else {
          if (value.length <= 5) {
            return "Password length should be more 5 characters.";
          }
        }
      },
      onSaved: (String value) {
        valPasswd = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[registerButton(context)],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              nameTextFromField(),
              userTextFromField(),
              passwordTextFromField()
            ],
          ),
        ),
      ),
    );
  }
}
