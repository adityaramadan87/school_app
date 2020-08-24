import 'package:flutter/material.dart';
import 'package:school_app/common/Constant.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TF"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          "the Fuck",
          style: TextStyle(
            fontFamily: Constant.POPPINS,
            fontSize: 24
          ),
        ),
      ),
    );
  }
}
