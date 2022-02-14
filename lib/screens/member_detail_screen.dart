import 'package:flutter/material.dart';
import 'package:gondwana_club/global_style/style.dart';
import 'package:flutter/cupertino.dart';
import '../model/member.dart';
import '../rest_api/member_details_api.dart';

class MemberDetailScreen extends StatefulWidget {

  String memberNum;
  MemberDetailScreen({required this.memberNum});

  @override
  MemberDetailState createState() => MemberDetailState();
}

class MemberDetailState extends State<MemberDetailScreen> {

  Future<Member>? futureMember;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      print('in Member Detail initState');
    futureMember = memberDetailMethod(widget.memberNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppStyle.appBarColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Member Details',style: TextStyle(color: AppStyle.appBarColor)),
          backgroundColor: Colors.transparent
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
        child:FutureBuilder<Member>(
          future: futureMember ,
          builder: (context, snapshot) {
            if (snapshot.hasData) {

               return Column(
                  children: [

                    Container(
                     child:CircleAvatar(
                      radius: 70,
                      child: ClipOval(
                        child:Icon(Icons.person, size: 100),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Container(
                    width: 400,
                    padding: EdgeInsets.fromLTRB(18, 15, 20, 10),
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                  ),
                  child: Column(
                  children: [
                  Container(
                      child: Text(snapshot.data!.MemberName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                    ),
                    SizedBox(height: 7),

                    Container(
                      child:  Text('MemberId : ${snapshot.data!.MemberId}',style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 7),
                    Container(
                      child:  Text('Member Category: ${snapshot.data!.MemberCategory}',style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 7),
                    Container(
                      child:  Text('Member Type: ${snapshot.data!.MemberTypeName}',style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 7),
                    Container(
                      child:  Text('Active From: ${snapshot.data!.ActiveFrom}',style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      child:  Text(snapshot.data!.City,style: TextStyle(fontSize: 20)),
                    ),

                    SizedBox(height: 7),

            SizedBox(height: 8),
            Container(
            child:  Divider(
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            ),
            ),
                    SizedBox(height: 20),

                    // Container(
                    //   child:  Text('Member Category: ${snapshot.data!.MemberCategory}',style: TextStyle()),
                    // ),
                    // Container(
                    //   child:  Text('Member Type: ${snapshot.data!.MemberTypeName}',style: TextStyle()),
                    // ),
                    // Container(
                    //   child:  Text('Active From: ${snapshot.data!.ActiveFrom}',style: TextStyle()),
                    // ),

                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 10),
                      child:  Text('Details',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 10),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                              Container(
                              child: Icon(Icons.email),
                            ),
                            SizedBox(width: 10),
                          //   child: Icon(Icons.email),
                          // ),
                          // SizedBox(width: 10),
                          Container(
                            child: Text(snapshot.data!.EmailAddress),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            child: Icon(Icons.call),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: Text(snapshot.data!.MobileNumber),
                          ),
                          // SizedBox(width: 10),
                          // Container(
                          //   child: Text(snapshot.data!.MobileNumber),
                          // ),
                        ],
                      ),
                    ),




            ],
            ),
            ),
            ]),
            )]);
          }
            else{
              print('Something went wrong');
              return CircularProgressIndicator();
            }
          }
        ),
      ),
    );

  }
}