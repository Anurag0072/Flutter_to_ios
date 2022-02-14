
import 'package:flutter/material.dart';

class MemberDirectory{

  final int memberId;
  final IconData icon;
  final String memberName;
  final String memberType;
  final String memberBusiness;
  final String memberAddress;
  final String memberCity;
  final String memberState;
  final String memberCountry;

  MemberDirectory({
    required this.memberId,
    required this.icon,
    required this.memberName,
    required this.memberType,
    required this.memberBusiness,
    required this.memberAddress,
    required this.memberCity,
    required this.memberState,
    required this.memberCountry
  });


}