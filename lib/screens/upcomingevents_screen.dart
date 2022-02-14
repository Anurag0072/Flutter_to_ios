import 'package:flutter/material.dart';
import 'package:gondwana_club/global_style/style.dart';
import 'package:flutter/cupertino.dart';

class UpcomingEventsScreen extends StatefulWidget {
  @override
  UpcomingEventsScreenState createState() => UpcomingEventsScreenState();
}

class UpcomingEventsScreenState extends State<UpcomingEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
        backgroundColor: AppStyle.appBarColor,
      ),
    );
  }

}