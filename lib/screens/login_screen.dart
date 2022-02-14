import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gondwana_club/global_style/style.dart';
import 'package:get/get.dart';
import '../model/login.dart';
import '../rest_api/login_api.dart';
import 'forget_password_screen.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginPageScreen extends StatefulWidget {

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPageScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController memberIdController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  bool _isObscure = true;

  Future<Login>? futureLogin;

  final sessionUserData = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sessionUserData.writeIfNull('isLogged', false);
    Future.delayed(Duration.zero, () async{
      checkIfLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(
                child: Container(
                  width: 100,
                  height: 140,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('assets/app_logo.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                obscureText: _isObscure,
                keyboardType: TextInputType.text,
                controller: pswdController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  // RegExp regex = RegExp(regPassValidation);

                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  // else {
                  //   if (!regex.hasMatch(value)) {
                  //     return 'Enter valid password';
                  //   } else {
                  //     return null;
                  //   }
                  // }
                  // else if(regex.hasMatch(value)){
                  //   return 'Enter validate password';
                  // }
                  return null;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ForgetPasswordScreen()));
                // Navigator.push(context, MaterialPageRoute(builder: (_) => RestPasswordScreen(memberId: memberIdController.text)));
              },
              //Forgot Password Textwidget
              child: Text(
                'Forgot Password',
                style: TextStyle(color: AppStyle.appBarColor, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: AppStyle.appBarColor,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {

                  if (formGlobalKey.currentState!.validate()) {

                    setState(() {
                      print("before _loginApiCall");
                      _loginApiCall();
                    });

                  }
                },
                child: Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            // Register TextButton
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: AppStyle.appBarColor),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignupPage()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }

  void _loginApiCall() {
    print('in _loginApiCall');
    String username  = memberIdController.text;
    String password = pswdController.text;
    print('in _loginApiCall username = '+username);
    print('in _loginApiCall password = '+password);
    futureLogin = loginMethod(username,password);

    String memberCategory;
    String memberNum;
    String portalPassword;
    futureLogin!.then((value) => {
      memberCategory = value.MemberCategory,

      memberNum = value.MemberNumber!,
      portalPassword = value.PortalPassword!,

      if(memberNum != username || portalPassword != password){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.Message))),
      }
      else if(memberCategory != 'Primary'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.Message))),

      }
      else if ( username == value.MemberNumber &&  password == value.PortalPassword){

          sessionUserData.write('isLogged', true),
          sessionUserData.write('loginId', value.MemberNumber),
          sessionUserData.write('MemberId', value.MemberId),
          sessionUserData.write('MemberName', value.MemberName),
          sessionUserData.write('MemberCode', value.MemberCode),

          sessionUserData.write('PortalPassword', value.PortalPassword),
          sessionUserData.write('MemberCategoryId', value.MemberCategoryId),
          sessionUserData.write('MemberCategory', value.MemberCategory),
          sessionUserData.write('IsActive', value.IsActive),
          sessionUserData.write('MemberTypeId', value.MemberTypeId),

          sessionUserData.write('MemberTypeName', value.MemberTypeName),
          sessionUserData.write('City', value.City),
          sessionUserData.write('MobileNumber', value.MobileNumber),
          sessionUserData.write('EmailAddress', value.EmailAddress),
          sessionUserData.write('ActiveFrom', value.ActiveFrom),

          print('value.MemberTypeName = '+value.MemberTypeName),

            print('in Success'),
          Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen())),
         // Get.offAll(HomeScreen()),
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.Message))),


      }
      else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.Message))),
          }

      // if(memberCategory != 'Primary'){
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Only a Primary Member can login.'))),
      // }
      // else if(memberCategory == 'Blocked'){
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This Account Is Blocked.'))),
      // }
      // else if( username == value.MemberNumber &&  password == value.PortalPassword){
      //     sessionUserData.write('isLogged', true),
      //     sessionUserData.write('loginId', value.MemberNumber),
      //     sessionUserData.write('MemberId', value.MemberId),
      //     sessionUserData.write('MemberName', value.MemberName),
      //
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.Message))),
      //     Navigator.push(context,
      //            MaterialPageRoute(builder: (_) => HomeScreen())),
      // }else{
      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid UserName and pasasword'))),
      //       //Navigator.push(context,
      //           // MaterialPageRoute(builder: (_) => HomeScreen(msg: value.Message,))),
      // }


  });

  }

  void checkIfLogin(){
    sessionUserData.read('isLogged') ? Get.offAll(HomeScreen()) : Get.offAll(LoginPageState()) ;
  }

}
