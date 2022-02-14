import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gondwana_club/global_style/style.dart';
import 'package:gondwana_club/rest_api/login_api.dart';
import 'package:gondwana_club/screens/login_screen.dart';
import 'package:gondwana_club/screens/splash_screen.dart';
import '../rest_api/register_api.dart';
import '../model/member_search_param.dart';
import 'package:gondwana_club/model/register.dart';


class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {

GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();
  final formGlobalKey = GlobalKey<FormState>();
  late ScaffoldMessengerState scaffoldMessenger ;


  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController emailaddressController = new TextEditingController();
  TextEditingController membernumberController = new TextEditingController();
  TextEditingController mobilenumberController = new TextEditingController();
  TextEditingController remarkController = new TextEditingController();


  Future<Register>? futureRegister;

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              )),
        ),
        body: Form(
          key: formGlobalKey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppStyle.appBarColor,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Text(
                              "To Create an Account",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            controller: firstnameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                                hintText: 'Enter valid name as Mihir'),
                          ),

                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            controller: lastnameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'last Name',
                                hintText: 'Enter valid name as Mihir'),
                          ),

                        ),


                        
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(

                            controller: membernumberController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Member Number',
                                hintText: 'Enter valid name asAD456789'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            controller: mobilenumberController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Mobile Number',
                                hintText: 'Enter valid number as@7972921879 '),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            controller: emailaddressController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'EmailAddress',
                                hintText: 'Enter valid emailaddress as mihirnaidu@gmail.com '),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            controller: remarkController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Remark',
                                hintText: 'Enter Remark '),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          child: Container(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {

                                if (formGlobalKey.currentState!.validate()) {

                                  setState(() {
                                    _registerapicall();
                                  });

                                }
                              },
                              color: AppStyle.appBarColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "REGISTER YOURSELF",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Already have an account?'),
                            TextButton(
                              child: Text('Login',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppStyle.appBarColor)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginPageScreen()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }

   void _registerapicall() {

    print('in _registerapicall');
    String FirstName  = firstnameController.text;
    String LastName = lastnameController.text;
    String EmailAddress = emailaddressController.text;
    String MemberNumber = membernumberController.text;
    String MobileNumber = mobilenumberController.text;
    String Remarks = remarkController.text;
    print('in _registerapicall MemberName = '+FirstName);
    print('in _registerapicall MemberName = '+LastName);
    print('in _registerapicall EmailAddress = '+EmailAddress);
    print('in _registerapicall MobileNumber = '+MobileNumber);
    print('in _registerapicall MemberNumber = '+MemberNumber);
    print('in _registerapicall Remarks = '+Remarks);
    //futureRegister = 
    RegisterMethod(MemberNumber, FirstName, LastName, MobileNumber, EmailAddress, Remarks);

  /*  String number;
    futureRegister!.then((value) => {
      number = value.MemberNumber,

      if(number != null ){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('You are already registered.'))),
      }
      else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Welcome"))),
            Navigator.push(context,
                 MaterialPageRoute(builder: (_) => LoginPageScreen())),
          }


  });*/

  }

    
    // futureMemberSearchParam!.then((value) => {
    //   //if(value){
    //
    //  // }
    // });

  }

