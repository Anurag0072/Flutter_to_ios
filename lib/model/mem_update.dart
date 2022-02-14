class UpdateProfile {

  //final bool ProfileType;
  final String MemberNumber;
  final String EmailAddress;
  final String MobileNumber;
  const UpdateProfile({
    //required this.ProfileType,
    required this.MemberNumber,
    required this.EmailAddress,
    required this.MobileNumber,
  });

  factory UpdateProfile.fromJson(Map<String, dynamic> Json) {
    return UpdateProfile(
      //ProfileType: Json['ProfileType'],
      MemberNumber: Json['MemberNumber'],
      EmailAddress: Json['EmailAddress'],
      MobileNumber: Json['MobileNumber'],
    );
  }
}