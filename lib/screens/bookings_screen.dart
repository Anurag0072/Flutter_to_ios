import 'package:flutter/material.dart';
import 'package:gondwana_club/global_style/style.dart';
import 'package:flutter/cupertino.dart';

class BookingScreen extends StatefulWidget {

  @override
  BookingScreenState createState() => BookingScreenState();
}

class BookingScreenState extends State<BookingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Booking'),
        backgroundColor: AppStyle.appBarColor,

      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
                fit: BoxFit.cover)
        ),
        child: Center(
            child: Column(
              children: [
              Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.book_online),
                    title: Text('Tables'),
                    onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()),
                },
              ),
            ),
          ),

              Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.book_online),
                    title: Text('Card Room'),
                  ),
                ),
              ),

              Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.book_online),
                    title: Text('Halls and Loans'),
                  ),
                ),
              ),

              Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.book_online),
                    title: Text('Rooms'),
                  ),
                ),
              ),

              Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 100,

                    child: Card(
                      child: Text('Card 1',textAlign: TextAlign.center,),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    child: Card(
                      child: Text('Card 2'),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    child: Card(
                      child: Text('Card 3'),
                  ),
                ),

              ],
            ),
          )

            ],
          ),
        ),
      )

    );
  }


}