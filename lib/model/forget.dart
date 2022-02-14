class Forget {

  final String MemberNumber;

  const Forget({
    required this.MemberNumber,
    
  });

  factory Forget.fromJson(Map<String, dynamic> Json) {
    return Forget(
      MemberNumber: Json['MemberNumber'],
      
      
    );
  }
}