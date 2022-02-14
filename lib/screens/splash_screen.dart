import 'dart:async';
import 'package:flutter/material.dart';
import '../global_style/style.dart';
import 'login_screen.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginPageScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //width: 100,
        //height: 80,
        //color: AppStyle.appBarColor,
        child: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                //height: 80,
                padding: const EdgeInsets.fromLTRB(20, 240, 20, 0),
                child: Image.asset('assets/app_logo.png'),
              ),
              const SizedBox(height: 20),
              Container(
                child: const Text('GONDWANA-CLUB',
                    style: TextStyle(fontSize: 20,)),
              ),
            ],
          ),
        ),
        //FlutterLogo(size:MediaQuery.of(context).size.height)
      ),
    );
  }
}
