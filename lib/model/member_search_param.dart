
class MemberSearchParam {

  final String MemberId ;
  final String UserName ;
  final String Password ;
  final String MemberNumber ;
  final String FirstName ;
  final String LastName ;

  final String MobileNumber;
  final String EmailAddress;
  final String Remarks;
  final bool ProfileType;
  final bool ByMemberNo;

  final bool ByMemberName ;
  final bool ByMemberType ;
  final bool ByMemberEmail;
  final bool ByProfession  ;
  final String MemberName ;

  final String MemberType ;
  final String Email ;
  final String Profession;
  final int MemberCategoryId;
  final String MemberCategory;

  final String Message;
  final String IsActive;
  final int MemberTypeId;
  final String MemberTypeName;
  final String ActiveFrom;

  final String City;


  MemberSearchParam({
    required this.MemberId,
      required this.UserName,
      required this.Password,
      required this.MemberNumber,
      required this.FirstName,
      required this.LastName,

      required this.MobileNumber,
      required this.EmailAddress,
      required this.Remarks,
      required this.ProfileType,
      required this.ByMemberNo,

      required this.ByMemberName,
      required this.ByMemberType,
      required this.ByMemberEmail,
      required this.ByProfession,
      required this.MemberName,

      required this.MemberType,
      required this.Email,
      required this.Profession,
      required this.MemberCategoryId,
      required this.MemberCategory,

      required this.Message,
      required this.IsActive,
      required this.MemberTypeId,
      required this.MemberTypeName,
      required this.ActiveFrom,

      required this.City
  });

  factory MemberSearchParam.fromJson(Map<String, dynamic> json) {
    return MemberSearchParam(
      MemberId: json['MemberId'],
      UserName: json['UserName'],
      Password: json['Password'],
      MemberNumber: json['MemberNumber'],
      FirstName: json['FirstName'],
      LastName: json['LastName'],

      MobileNumber: json['MobileNumber'],
      EmailAddress: json['EmailAddress'],
      Remarks: json['Remarks'],
      ProfileType: json['ProfileType'],
      ByMemberNo: json['ByMemberNo'],

      ByMemberName: json['ByMemberName'],
      ByMemberType: json['ByMemberType'],
      ByMemberEmail: json['ByMemberEmail'],
      ByProfession: json['ByProfession'],
      MemberName: json['MemberName'],

      MemberType: json['MemberType'],
      Email: json['Email'],
      Profession: json['Profession'],
      MemberCategoryId: json['MemberCategoryId'],
      MemberCategory: json['MemberCategory'],


      Message: json['Message'],
      IsActive: json['IsActive'],
      MemberTypeId: json['MemberTypeId'],
      MemberTypeName: json['MemberTypeName'],
      ActiveFrom: json['ActiveFrom'],

      City: json['City'],


    );
  }
}