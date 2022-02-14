import 'package:flutter/material.dart';
import 'package:gondwana_club/food/animation/ScaleRoute.dart';
import 'package:gondwana_club/food/pages/FoodOrderPage.dart';
import 'package:gondwana_club/food/pages/SignInPage.dart';
import 'package:gondwana_club/food/widgets/BestFoodWidget.dart';
import 'package:gondwana_club/food/widgets/BottomNavBarWidget.dart';
import 'package:gondwana_club/food/widgets/PopularFoodsWidget.dart';
import 'package:gondwana_club/food/widgets/SearchWidget.dart';
import 'package:gondwana_club/food/widgets/TopMenus.dart';

class HomePageFd extends StatefulWidget {
  @override
  _HomePageFdState createState() => _HomePageFdState();
}
class _HomePageFdState extends State<HomePageFd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {Navigator.push(context, ScaleRoute(page: FoodOrderPage()));})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchWidget(),
            TopMenus(),
            PopularFoodsWidget(),
            BestFoodWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
