
class Member {
  final int MemberId ;
  final String MemberNumber ;
  final String MemberName ;
  final int MemberCategoryId;
  final String MemberCategory;

  final String MemberCode;
  final bool IsActive;
  final int MemberTypeId;
  final String MemberTypeName;
  final String ActiveFrom;

  final String MobileNumber;
  final String EmailAddress;
  final String City;


  Member({
    required this.MemberId,
    required this.MemberNumber,
    required this.MemberName,
    required this.MemberCategoryId,
    required this.MemberCategory,

    required this.MemberCode,
    required this.IsActive,
    required this.MemberTypeId,
    required this.MemberTypeName,
    required this.ActiveFrom,

    required  this.MobileNumber,
    required this.EmailAddress,
    required this.City
      });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(

      MemberId: json['MemberId'],
      MemberNumber: json['MemberNumber'],
      MemberName: json['MemberName'],
      MemberCategoryId: json['MemberCategoryId'],
      MemberCategory: json['MemberCategory'],

      MemberCode: json['MemberCode'],
      IsActive: json['IsActive'],
      MemberTypeId: json['MemberTypeId'],
      MemberTypeName: json['MemberTypeName'],
      ActiveFrom: json['ActiveFrom'],

      MobileNumber: json['MobileNumber'],
      EmailAddress: json['EmailAddress'],
      City: json['City'],

    );
  }
}