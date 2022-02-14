import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../global_style/style.dart';
import 'reset_password_screen.dart';
import '../model/forget.dart';
import '../rest_api/forget_api.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  ForgetPasswordState createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPasswordScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController memberIdController = TextEditingController();
  TextEditingController memberController = TextEditingController();

  Future<Forget>? futureForget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Forget Password'),
        backgroundColor: AppStyle.appBarColor,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 4, 30, 4),
                child: TextFormField(
                  //obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: memberIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Member Id',
                    hintText: 'Enter Member Id',
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter MemberId';
                    }
                    return null;
                  },
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(30, 4, 30, 4),
              //   child: TextFormField(
              //     //obscureText: true,
              //     keyboardType: TextInputType.text,
              //     controller: memberIdController,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'new pasasword',
              //       hintText: 'Enter Member Id',
              //     ),
              //
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter MemberId';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Validate'),
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    setState(() {
                      print("before _forgetApiCall");
                      _forgetApiCall();
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
  void _forgetApiCall() {
    print('in _forgetApiCall');
    String MemberNumber  = memberIdController.text;
    print('in _forgetApiCall MemberNumber = '+MemberNumber);
   // futureForget = 
    forgetMethod(MemberNumber);

    
    
    /*futureForget!.then((value) => {
    
      
      if(MemberNumber != value.MemberNumber){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid MemberNumber'))),
      
      }
      else{
            Navigator.push(context,
                 MaterialPageRoute(builder: (BuildContext context) => 
                 RestPasswordScreen(memberId:memberIdController.text))),
          }


  });*/
 

  }
}
