// import 'package:flutter/material.dart';
//
// import '../global_style/style.dart';
// import '../member_directory.dart';
// import 'member_detail_screen.dart';
//
// class MemberDirectoryScreenXX extends StatefulWidget {
//   @override
//   MemberDirectoryState createState() => MemberDirectoryState();
// }
//
// class MemberDirectoryState extends State<MemberDirectoryScreenXX> {
//  // int _currentStep = 0;
//
//   final List<MemberDirectory> memberList = [
//     MemberDirectory(memberId: 1, icon: Icons.person, memberName: 'Satish Gohane', memberType: 'Regular', memberBusiness: 'Furniture',
//         memberAddress: 'W-54 Itwari', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//     MemberDirectory(memberId: 2, icon: Icons.person, memberName: 'Rohan Chhapane', memberType: 'Gold', memberBusiness: 'IT Service',
//         memberAddress: 'E-53 Manewada', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//     MemberDirectory(memberId: 3, icon: Icons.person, memberName: 'Raunak Harde', memberType: 'Silver', memberBusiness: 'Cloths',
//         memberAddress: 'E-53 Pardi', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//     MemberDirectory(memberId: 4, icon: Icons.person, memberName: 'Mihir Naidu', memberType: 'Silver', memberBusiness: 'Grocery',
//         memberAddress: 'E-53 Sai Vihar', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//     MemberDirectory(memberId: 5, icon: Icons.person, memberName: 'Kalpesh Pimpalekar', memberType: 'Gold', memberBusiness: 'Electronis',
//         memberAddress: 'E-53 Sringar', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//     MemberDirectory(memberId: 6, icon: Icons.person, memberName: 'Nehal Bhandarkar', memberType: 'Regular', memberBusiness: 'Novelty',
//         memberAddress: 'E-53 Bhande plot', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//     MemberDirectory(memberId: 7, icon: Icons.person, memberName: 'Rudraksh Verma', memberType: 'Gold', memberBusiness: 'Book Shop',
//         memberAddress: 'E-53 It Park', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//     MemberDirectory(memberId: 8, icon: Icons.person, memberName: 'Rutwik Sharma', memberType: 'Regular', memberBusiness: 'Cosmetics',
//         memberAddress: 'E-53 Manewada', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Member List Page'),
//           backgroundColor: AppStyle.appBarColor,
//         ),
//         body: ListView.builder( // Widget which creates [ItemWidget] in scrollable list.
//           itemCount: memberList.length, // Number of widget to be created.
//           itemBuilder: (context, itemIndex) => // Builder function for every item with index.
//           MemberWidget(memberList[itemIndex], () {
//             _onItemTap(context, itemIndex);
//           }),
//         ));
//   }
//
//     _onItemTap(BuildContext context, int itemIndex) {
//       Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => MemberDetailsScreen(memberList[itemIndex])));
//     }
//   }
//
//   class MemberWidget extends StatelessWidget {
//     const MemberWidget(this.member, this.onItemTap, {Key? key}) : super(key: key);
//
//     final MemberDirectory member;
//     final Function onItemTap;
//
//     @override
//     Widget build(BuildContext context) {
//       return InkWell( // Enables taps for child and add ripple effect when child widget is long pressed.
//         child: ListTile( // Useful standard widget for displaying something in ListView.
//             leading: Icon(member.icon),
//             title: Text(member.memberName),
//             onTap: (){
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => MemberDetailsScreen(member)));
//             }
//         ),
//       );
//     }
//   }
//
//
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Member's Directory"),
// //         backgroundColor: AppStyle.appBarColor,
// //       ),
// //       body: SafeArea(
// //         child: Stepper(
// //           steps: const [
// //             Step(
// //                 title: Text('Satish Gohane'),
// //                 content: Text(
// //                     'memberType: Regular, memberBusiness: Furniture, memberAddress: W-54 Itwari, memberCity: Nagpur,memberState: Maharashtra, memberCountry: India')),
// //             Step(
// //                 title: Text('Satish Gohane'),
// //                 content: Text(
// //                     'memberType: Regular, memberBusiness: Furniture, memberAddress: W-54 Itwari, memberCity: Nagpur,memberState: Maharashtra, memberCountry: India')),
// //             Step(
// //                 title: Text('Satish Gohane'),
// //                 content: Text(
// //                     'memberType: Regular, memberBusiness: Furniture, memberAddress: W-54 Itwari, memberCity: Nagpur,memberState: Maharashtra, memberCountry: India')),
// //           ],
// //           onStepTapped: (int newIndex) {
// //             setState(() {
// //               _currentStep = newIndex;
// //             });
// //           },
// //           currentStep: _currentStep,
// //           onStepContinue: () {
// //             if (_currentStep != 2) {
// //               setState(() {
// //                 _currentStep += 1;
// //               });
// //             }
// //           },
// //           onStepCancel: () {
// //             if (_currentStep != 0) {
// //               setState(() {
// //                 _currentStep -= 1;
// //               });
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//   // final List<MemberDirectory> memberList = [
//   //   MemberDirectory(memberId: 1, icon: Icons.person, memberName: 'Satish Gohane', memberType: 'Regular', memberBusiness: 'Furniture',
//   //       memberAddress: 'W-54 Itwari', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   //   MemberDirectory(memberId: 2, icon: Icons.person, memberName: 'Rohan Chhapane', memberType: 'Gold', memberBusiness: 'IT Service',
//   //       memberAddress: 'E-53 Manewada', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   //   MemberDirectory(memberId: 3, icon: Icons.person, memberName: 'Raunak Harde', memberType: 'Silver', memberBusiness: 'Cloths',
//   //       memberAddress: 'E-53 Pardi', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   //   MemberDirectory(memberId: 4, icon: Icons.person, memberName: 'Mihir Naydu', memberType: 'Silver', memberBusiness: 'Grocery',
//   //       memberAddress: 'E-53 Sai Vihar', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   //   MemberDirectory(memberId: 5, icon: Icons.person, memberName: 'Kalpesh Pimpalekar', memberType: 'Gold', memberBusiness: 'Electronis',
//   //       memberAddress: 'E-53 Sringar', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   //   MemberDirectory(memberId: 6, icon: Icons.person, memberName: 'Nehal Bhandarkar', memberType: 'Regular', memberBusiness: 'Novelty',
//   //       memberAddress: 'E-53 Bhande plot', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   //   MemberDirectory(memberId: 7, icon: Icons.person, memberName: 'Rudraksh Verma', memberType: 'Gold', memberBusiness: 'Book Shop',
//   //       memberAddress: 'E-53 It Park', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   //   MemberDirectory(memberId: 8, icon: Icons.person, memberName: 'Rutwik Sharma', memberType: 'Regular', memberBusiness: 'Cosmetics',
//   //       memberAddress: 'E-53 Manewada', memberCity: 'Nagpur',memberState: 'Maharashtra',memberCountry: 'India' ),
//   // ];
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //       appBar: AppBar(
//   //         title: Text('Member List Page'),
//   //         backgroundColor: AppStyle.appBarColor,
//   //       ),
//   //       body: ListView.builder( // Widget which creates [ItemWidget] in scrollable list.
//   //         itemCount: memberList.length, // Number of widget to be created.
//   //         itemBuilder: (context, itemIndex) => // Builder function for every item with index.
//   //         MemberWidget(memberList[itemIndex], () {
//   //           _onItemTap(context, itemIndex);
//   //         }),
//   //       ));
//   // }
//
// //   _onItemTap(BuildContext context, int itemIndex) {
// //     Navigator.of(context).push(MaterialPageRoute(
// //         builder: (context) => MemberDetailsScreen(memberList[itemIndex])));
// //   }
// // }
//
// // class MemberWidget extends StatelessWidget {
// //   const MemberWidget(this.member, this.onItemTap, {Key? key}) : super(key: key);
//
// //   final MemberDirectory member;
// //   final Function onItemTap;
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell( // Enables taps for child and add ripple effect when child widget is long pressed.
// //       child: ListTile( // Useful standard widget for displaying something in ListView.
// //           leading: Icon(member.icon),
// //           title: Text(member.memberName),
// //           onTap: (){
// //             Navigator.of(context).push(MaterialPageRoute(
// //                 builder: (context) => MemberDetailsScreen(member)));
// //           }
// //       ),
// //     );
// //   }
// // }