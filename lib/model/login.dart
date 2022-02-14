
class Login {

  final int? MemberId ;
  final String? MemberNumber;
  final String? MobileNumber;
  final String? EmailAddress;
  final String? MemberName ;

  final int MemberCategoryId;
  final String MemberCategory;
  final String Message;
  final bool IsActive;
  final int MemberTypeId;

  final String MemberTypeName;
  final String? ActiveFrom;
  final String? City;
  final String? MemberCode;
  final String? PortalPassword;

  final String? UserName;
  final String? Password;


  const Login({
    required this.MemberId,
    required this.MemberNumber,
    required this.MobileNumber,
    required this.EmailAddress,
    required this.MemberName,

    required this.MemberCategoryId,
    required this.MemberCategory,
    required this.Message,
    required this.IsActive,
    required this.MemberTypeId,

    required this.MemberTypeName,
    required this.ActiveFrom,
    required this.City,
    required this.MemberCode,
    required this.PortalPassword,

    required this.UserName,
    required this.Password,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      MemberId: json['MemberId'],
      MemberNumber: json['MemberNumber'],
      MobileNumber: json['MobileNumber'],
      EmailAddress: json['EmailAddress'],
      MemberName: json['MemberName'],

      MemberCategoryId: json['MemberCategoryId'],
      MemberCategory: json['MemberCategory'],
      Message: json['Message'],
      IsActive: json['IsActive'],
      MemberTypeId: json['MemberTypeId'],

      MemberTypeName: json['MemberTypeName'],
      ActiveFrom: json['ActiveFrom'],
      City: json['City'],
      MemberCode: json['MemberCode'],
      PortalPassword: json['PortalPassword'],

      UserName: json['UserName'],
      Password: json['Password'],

    );
  }
}