import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gondwana_club/global_style/style.dart';
//import 'package:gondwana_club/screens/payment_checkout_screen.dart';
import 'package:gondwana_club/widget/buttons.dart';
import 'package:gondwana_club/widget/large_button.dart';
import 'package:gondwana_club/widget/text_size.dart';
import 'package:gondwana_club/widgets/buttons.dart';
import 'package:gondwana_club/widgets/large_button.dart';
import 'package:gondwana_club/widgets/text_size.dart';

class AccountsScreen extends StatefulWidget {
  @override
  AccountsScreenState createState() => AccountsScreenState();
}

class AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
        backgroundColor: AppStyle.appBarColor,
      ),
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 220,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
        ],
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
        right: 45,
        bottom: 14,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: Color(0xFFeef1f4).withOpacity(0.6),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 215,
                            )),
                        Positioned(
                            top: 5,
                            right: 40,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 25),
                              width: 60,
                              height: 250,
                              decoration: BoxDecoration(
                                  color: AppStyle.appBarColor,
                                  borderRadius: BorderRadius.circular(28)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButton(
                                    icon: Icons.cancel,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  AppButton(
                                    icon: Icons.add,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {},
                                    text: "Add Bill",
                                  ),
                                  AppButton(
                                    icon: Icons.history,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {},
                                    text: "History",
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/lines.png")),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: Offset(0, 1),
                      color: Color(0xFF11324d).withOpacity(0.2))
                ]),
          ),
        ));
  }

  _mainBackground() {
    return Positioned(
        bottom: 10,
        left: 0,
        child: Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/background1r.png"))),
        ));
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: -5,
      bottom: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/curve.png"))),
      ),
    );
  }

  _listBills() {
    return Positioned(
      top: 215,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(top: 15, right: 20),
              height: 120,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd8dbe0),
                      offset: Offset(1, 1),
                      blurRadius: 20,
                      spreadRadius: 10,
                    )
                  ]),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.grey,
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/brand1.png"))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tree Top",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Bill No: 2168455",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.idColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedText(
                            text: "Pay On or Before 30th Jan 2021",
                            color: AppColor.green),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.selectBackground),
                                child: Center(
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.selectColor),
                                  ),
                                )),
                            Expanded(child: Container()),
                            Text(
                              "\$1250",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: AppColor.mainColor),
                            ),
                            Text(
                              "Due in 13 days",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.idColor),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        Container(
                          width: 5,
                          height: 35,
                          decoration: BoxDecoration(
                              color: AppColor.halfOval,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _payButton() {
    return Positioned(
        bottom: 10,
        child: Column(
          children: [
            GestureDetector(
              child: AppPayButton(
                text: "Pay all bills",
                textColor: Colors.white,
                backgorundColor: AppStyle.appBarColor,
              ),
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => ));
              // },
            )
          ],
        ));
  }
}
