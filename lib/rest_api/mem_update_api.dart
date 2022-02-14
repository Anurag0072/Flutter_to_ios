import 'dart:convert';

import '../global_style/global_variables.dart';
import '../model/mem_update.dart';
import '../model/member_search_param.dart';
import 'package:http/http.dart' as http;


//Future<Register>
void UpdateMethod(String MemberNumber,String MobileNumber,String EmailAddress) async {
  print("UpdateMethod");

  final response = await http.post(
    Uri.parse('$ROOT/api/MemberApp/UpdateMember'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'MemberNumber': MemberNumber,
      //'ProfileType': ProfileType,
      'MobileNumber': MobileNumber,
      'EmailAddress': EmailAddress,
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