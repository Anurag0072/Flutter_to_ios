import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gondwana_club/screens/search.dart';
import '../global_style/style.dart';
import '../model/member.dart';
import '../rest_api/member_list_api.dart';
import 'member_detail_screen.dart';

class MemberDirectoryScreen extends StatefulWidget {

  @override
  MemberDirectoryState createState() => MemberDirectoryState();
}

class MemberDirectoryState extends State<MemberDirectoryScreen> {
  late Future<List<Member>> futureMemberSearchParam;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    futureMemberSearchParam = fetchMemberListMethod();
    futureMemberSearchParam.then((value) => {
      print('MemberName in initState = '+value.first.MemberName),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Member List Page'),
          backgroundColor: AppStyle.appBarColor,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Jobs()));
                },
              ),
            ]),

        body: Container(
          child: FutureBuilder<List<Member>>(
            future: futureMemberSearchParam,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    child: Container(
                      //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                       // color: Color(0xff97FFFF),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 1,
                            child:  ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(snapshot.data![index].MemberName),
                              subtitle: Text(snapshot.data![index].MemberId.toString()),
                              trailing: Text(snapshot.data![index].City),
                              onTap: (){
                                String memberNum = snapshot.data![index].MemberNumber;
                                Get.off(MemberDetailScreen(memberNum: memberNum));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
    );
  }
}

