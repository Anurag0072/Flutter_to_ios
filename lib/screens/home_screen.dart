import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gondwana_club/screens/eventslist.dart';
import 'package:gondwana_club/screens/helpdesk.dart';
import 'package:gondwana_club/screens/profile_screen.dart';
import 'package:gondwana_club/screens/visitorinvitation.dart';
import 'package:flutter/cupertino.dart';
import '../event/Screens/HomeScreen.dart';
import '../food/widgets/BestFoodWidget.dart';
import '../food/widgets/BottomNavBarWidget.dart';
import '../food/widgets/PopularFoodsWidget.dart';
import '../food/widgets/SearchWidget.dart';
import '../food/widgets/TopMenus.dart';
import '../global_style/style.dart';
import 'accounts_screen.dart';
import 'affiliatedsclub_screen.dart';
import 'aminities_screen.dart';
import 'bookings_screen.dart';
import 'login_screen.dart';
import 'member_directory_screen.dart';
import 'privacy_screen.dart';
import 'yourorder_screen.dart';

class HomeScreen extends StatefulWidget {
  // String msg;
  // HomeScreen({required this.msg});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  final sessionUserData = GetStorage();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  bool generated = false;
  var _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  var data = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('in home initState = '+sessionUserData.read('loginId'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Home'),
        backgroundColor: AppStyle.appBarColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Color(0xff895842),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Orders',
            backgroundColor: Color(0xff895842),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Upload',
            backgroundColor: Color(0xff895842),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_outlined),
            label: 'Complain',
            backgroundColor: Color(0xff895842),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help',
            backgroundColor: Color(0xff895842),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   color: AppStyle.appBarColor,
      //   height: 55,
      //   index: index,
      //   items: items,
      //   backgroundColor: Colors.transparent,
      // ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                color: AppStyle.appBarColor,
              ),
              child: Container(
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      child: Container(
                        child: Text(sessionUserData.read('MemberName'),
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/calender-png.jpg'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Upcoming Events'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreenEv()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/booking2.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Bookings'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookingScreen()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/order-food.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Your Orders'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => YourOrderScreen()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/directory2.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Members Directory'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MemberDirectoryScreen()));
                //Navigator.push(context, MaterialPageRoute(builder: (context) => MemberDirectoryScreen()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/accounting1.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Accounts'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountsScreen()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/guest.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Guest Invite'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => guestinvite()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 28,
                height: 28,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/affiliated.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Affiliated Clubs'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AffiliatedClubScreen()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/security.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Privacy'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyScreen()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/directory2.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('About'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AminitiesScreen()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.8,
              color: Colors.blueGrey.withOpacity(0.5),
              indent: 32,
              endIndent: 32,
            ),
            ListTile(
              title: Container(
                width: 30,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/icon-logout.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                sessionUserData.write('isLogged', false);
                sessionUserData.remove('loginId');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPageScreen()));
              },
            ),

          ],
        ),
      ),

      body: PageView(
        controller: pageController,
        children: [
          Container(
            //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: [
                    /*====Search Bar========*/
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      // width: double.infinity,
                      color: AppStyle.appBarColor,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.greenAccent,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppStyle.appBarColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Search',
                          focusColor: Colors.white,
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    /*====Corousel- Image slider========*/
                    SizedBox(height: 10),
                    Container(
                      child: Card(
                        child: CarouselSlider(
                          items: [
                            Image(image: AssetImage('assets/hall1.jpg')),
                            Image(image: AssetImage('assets/hall2.jpg')),
                            Image(image: AssetImage('assets/hall3.jpg'))
                          ],
                          options: CarouselOptions(
                            height: 180,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            // aspectRatio: 16 / 9,
                            // autoPlayCurve: Curves.fastOutSlowIn,
                            // enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Card(
                        child: CarouselSlider(
                          items: [
                            Image(image: AssetImage('assets/upcoming2.jpg')),
                            Image(image: AssetImage('assets/hall2.jpg')),
                            Image(image: AssetImage('assets/hall3.jpg'))
                          ],
                          options: CarouselOptions(
                            height: 180,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            // aspectRatio: 16 / 9,
                            // autoPlayCurve: Curves.fastOutSlowIn,
                            // enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Card(
                        child: CarouselSlider(
                          items: [
                            Image(image: AssetImage('assets/hall1.jpg')),
                            Image(image: AssetImage('assets/hall2.jpg')),
                            Image(image: AssetImage('assets/hall3.jpg'))
                          ],
                          options: CarouselOptions(
                            height: 180,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            // aspectRatio: 16 / 9,
                            // autoPlayCurve: Curves.fastOutSlowIn,
                            // enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //second bottom navigation button
          Container(color: Colors.white,
          child: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            SearchWidget(),
            TopMenus(),
            PopularFoodsWidget(),
            BestFoodWidget(),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavBarWidget(),
          ),
          //third bottom navigation button
          Container(color: Colors.white),
          //fourth bottom navigation button
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: RichText(
                                text: const TextSpan(
                                    text: "Complaints",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1),
                  ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        maxHeight: double.infinity,
                      ),
                      // child: Container(
                      //     height: 450,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //       color: Colors.grey[200,
                      //     ),
                      //     padding: const EdgeInsets.only(
                      //         left: 16, right: 16, top: 48),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "Raise a Complaint",
                                            style: TextStyle(
                                              color: Color(0xff895842),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                                Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: RichText(
                                              text: TextSpan(
                                                  text: "Title",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ))),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller: titleController,
                                          // ignore: missing_return
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please Enter Title";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue.shade200,
                                                    width: 2.0),
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20),
                                              ),
                                              hintText:
                                                  "Enter title of your complaint"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: RichText(
                                              text: TextSpan(
                                                  text: "Subject",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ))),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller: subjectController,
                                          // ignore: missing_return
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please Enter Subject";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue.shade200,
                                                    width: 2.0),
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20),
                                              ),
                                              hintText:
                                                  "Enter subject of your complaint"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: ConstrainedBox(
                                            constraints:
                                                BoxConstraints.tightFor(
                                                    width: 200, height: 60),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  setState(() {
                                                    data =
                                                        " Name: ${titleController.text + "\n"} Visitors: ${subjectController.text + "\n"}";
                                                    generated = true;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                        content:
                                                            Text('Raised')),
                                                  );
                                                }
                                              },
                                              child: Text("Raise"),
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Colors.blue.shade700),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ))
                              ]))
                ],
              ),
            ),
          ),

          //fifth bottom navigation button
          Container(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       // GestureDetector(
                  //       //   onTap: () {
                  //       //     Navigator.of(context).pop();
                  //       //   },
                  //       //   // child: AppBarButton(
                  //       //   //   icon: Icons.arrow_back,
                  //       //   // ),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  // AvatarImage(),
                  // SocialIcons(),
                  SizedBox(height: 40),
                  Text(
                    'Help Desk',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Useful Contact Information\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                  ),
                  ProfileListItems(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
