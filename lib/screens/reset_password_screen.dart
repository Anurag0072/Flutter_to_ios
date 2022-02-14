import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/cupertino.dart';
import '../global_style/style.dart';
import 'login_screen.dart';

class RestPasswordScreen extends StatefulWidget {
  String memberId;
  RestPasswordScreen({required this.memberId});

  @override
  RestPasswordState createState() => RestPasswordState();
}

class RestPasswordState extends State<RestPasswordScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController pswdController = TextEditingController();
  TextEditingController confirmPswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Reset Password'),
        backgroundColor: AppStyle.appBarColor,
      ),
      body: Form(
        key: formGlobalKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Html(data: 'MemberId: <b>${widget.memberId}</b>'),
                // Text('MemberId: '+widget.memberId, style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 4, 30, 4),
                child: TextFormField(
                  //obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: pswdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contact number';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 4),
                child: TextFormField(
                  //obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: confirmPswdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Enter Confirm Password',
                  ),

                  validator: (value) {
                    String password = pswdController.text;
                    String confirmPswd = confirmPswdController.text;
                    if (password != confirmPswd) {
                      return 'Password and confirm password must be equals.';
                    }
                    return null;
                  },
                ),
              ),
              // SUBMIT BUTTON
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginPageScreen()));
                    });
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppStyle.appBarColor),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
