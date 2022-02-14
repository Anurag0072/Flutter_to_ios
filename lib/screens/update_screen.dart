import 'package:flutter/material.dart';
import 'package:gondwana_club/global_style/style.dart';
import 'package:gondwana_club/main.dart';
import 'package:gondwana_club/screens/login_screen.dart';
import 'package:gondwana_club/screens/splash_screen.dart';
import 'package:gondwana_club/screens/profile_screen.dart';
import 'package:gondwana_club/model/mem_update.dart';
import 'package:gondwana_club/rest_api/mem_update_api.dart';
import 'package:flutter/cupertino.dart';

enum SingingCharacter { Public, Pravite }

class UpdateDetails extends StatefulWidget {
  UpdateDetailsState createState()=> UpdateDetailsState();
}
class UpdateDetailsState extends State<UpdateDetails>{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final formGlobalKey = GlobalKey<FormState>();
  late ScaffoldMessengerState scaffoldMessenger;


  TextEditingController mobilenumberController = new TextEditingController();
  TextEditingController membernumberController = new TextEditingController();
  TextEditingController emailadddressController = new TextEditingController();
  // boolEditingController profiletypeController = new TextEditingController();

  SingingCharacter? _character = SingingCharacter.Public;

  Future<UpdateProfile>? futureUpdateProfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SafeArea(
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
                              "update Details",
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
                              "profile update",
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
                            obscureText: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Mobile Number',
                                hintText: 'Enter valid mobile number'),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email Address',
                                hintText: 'xyz@gmail.com'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Member Number',
                                hintText: 'Enter valid name as @123456789 '),
                          ),
                        ),
                        // Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 20, vertical: 10),
                        //     child: TextField(
                        //         obscureText: false,
                        //        decoration: InputDecoration(
                        //         labelText: 'Profile Type'),
                        //        ),
                        //     ),

                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Text('Profile Type', style: TextStyle(fontSize: 18),),
                        ),
                        Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Public'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.Public,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Pravite'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.Pravite,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),





                        /*Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Profile Type',
                                hintText: 'enter valid profile type'),
                          ),
                        ),*/
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
                                    print("before _UpdateApiCall");
                                    _UpdateApiCall();
                                  });
                                }

                              },
                              color: AppStyle.appBarColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "Update Profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));

  }
  void _UpdateApiCall() {
    print('in _UpdateApiCall');
    String MobileNumber  = mobilenumberController.text;
    String MemberNumber = membernumberController.text;
    String EmailAddress = emailadddressController.text;
    //bool ProfileType = profiletypeController.bool;
    print('in _UpdateApiCall MemberNumber = '+MemberNumber);
    print('in _UpdateApiCall MobileNumber = '+MobileNumber);
    print('in _UpdateApiCall EmailAddress = '+EmailAddress);
    //print('in _UpdateApiCall ProfileType = '+ProfileType);
    // futureForget =
    UpdateMethod(MemberNumber,MobileNumber,EmailAddress,);


    /*
    futureForget!.then((value) => {


      if(value.MemberNumber == null){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter MemberName'))),

      }
      else{
            Navigator.push(context,
                 MaterialPageRoute(builder: (BuildContext context) =>
                 RestPasswordScreen(memberId:memberIdController.text))),
          }


  });*/

  }
}

