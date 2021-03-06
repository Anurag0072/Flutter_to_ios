import 'dart:convert';

import '../global_style/global_variables.dart';
import '../model/register.dart';
import '../model/member_search_param.dart';
import 'package:http/http.dart' as http;


//Future<Register>
void RegisterMethod(String MemberNumber,String FirstName, String LastName, String MobileNumber,String EmailAddress,String Remarks) async {
  print("RegisterMethod");

  final response = await http.post(
    Uri.parse('$ROOT/api/MemberApp/MemberRegistration'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'MemberNumber': MemberNumber,
      'FirstName': FirstName,
      'LastName': LastName,
      'MobileNumber': MobileNumber,
      'EmailAddress': EmailAddress,
      'Remarks': Remarks,
    }),
  );

  print('response.statusCode = '+response.statusCode.toString());
  print('response.body = '+response.body);

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print('response.body = '+response.body);
    //return Register.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create MemberSearchParam.');
  }
}