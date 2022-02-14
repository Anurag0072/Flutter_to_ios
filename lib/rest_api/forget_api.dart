import 'dart:convert';

import '../global_style/global_variables.dart';
import '../model/forget.dart';
import '../model/member_search_param.dart';
import 'package:http/http.dart' as http;

//Future<Forget>
 void forgetMethod(String MemberNumber) async {
  print("forgetMethod");

  print("in forgetMethod MemberNumber = "+MemberNumber);
  

  final response = await http.post(
    Uri.parse('$ROOT/api/MemberApp/ForgotPwd'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'MemberNumber': MemberNumber,
    }),
  );

  print('response.statusCode = '+response.statusCode.toString());
  print('response.body = '+response.body);

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print('response.body = '+response.body);
   // return Forget.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create MemberSearchParam.');
  }
}