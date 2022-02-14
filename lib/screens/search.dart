import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Jobs extends StatefulWidget {
  Jobs() : super();

  @override
  JobsState createState() => JobsState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class JobsState extends State<Jobs> {
  final _debouncer = Debouncer();

  List<Subject> ulist = [];
  List<Subject> userLists = [];
  //API call for All Subject List

  String url = 'http://132.148.80.97:770/api/MemberApp/SearchMemberList';

  Future<List<Subject>> getAllulistList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<Subject> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Subject> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Subject>((json) => Subject.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    getAllulistList().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
  }

late Future<List<Subject>> futureMemberSearchParam;
  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'All Users',
      //     style: TextStyle(fontSize: 25),
      //   ),
      // ),
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20.0),
                //   borderSide: BorderSide(
                //     color: Colors.blue,
                //   ),
                // ),
                suffixIcon: InkWell(
                  child: Icon(Icons.search),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    userLists = ulist
                        .where(
                          (u) => (u.MemberId.toLowerCase().contains(
                                string.toLowerCase(),
                              )),
                        )
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: userLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            userLists[index].MemberId,
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            userLists[index].MemberName ?? "null",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Declare Subject class for json data or parameters of json string/data
//Class For Subject
class Subject {
  var MemberName;
  var MemberId;
  Subject({
    required this.MemberName,
    required this.MemberId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      MemberName: json['MemberName'],
      MemberId: json['MemberId'],
    );
  }
}