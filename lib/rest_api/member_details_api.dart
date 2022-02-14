import 'dart:convert';

import '../global_style/global_variables.dart';
import '../model/login.dart';
import '../model/member.dart';
import '../model/member_search_param.dart';
import 'package:http/http.dart' as http;

Future<Member> memberDetailMethod(String MemberNumber) async {
  print("memberDetailMethod");

  print("in memberDetailMethod MemberNum = "+MemberNumber);

  final response = await http.post(
    Uri.parse('$ROOT/api/MemberApp/GetMemberDetails'),

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

    print('response.body = '+response.body);
    return Member.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create MemberSearchParam.');
  }
}