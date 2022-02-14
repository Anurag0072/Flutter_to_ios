import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gondwana_club/global_style/style.dart';


class AminitiesScreen extends StatefulWidget {
  @override
  AminitiesScreenState createState() => AminitiesScreenState();
}



class AminitiesScreenState extends State<AminitiesScreen> {

  int _selected = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Aminities'),
        backgroundColor: AppStyle.appBarColor,
      ),
        body: ListView(
            controller: pageController,
                children: [
                    Container(
                    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
      child: Column(
      children: [
       //======**ForText**=====//

        Container(
        padding:  EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 10),
      child: Text(
      'SPORTS',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      ),
        SizedBox(height: 10),
        Container(
          child:Card(
            child: CarouselSlider(
              items: [
                Image(image: AssetImage('assets/swimming.jpg')),
                Image(image: AssetImage('assets/tennis.jpg')),
                Image(image: AssetImage('assets/billiards.jpg')),
                Image(image: AssetImage('assets/gym1.jpg')),
              ],
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration:
                Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ),
        Container(
          padding:  EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 10),
          child: Text(
            'DINING',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child:Card(
            child: CarouselSlider(
              items: [
                Image(image: AssetImage('assets/ferns-club-bistro.jpg')),
                Image(image: AssetImage('assets/unwind.jpg')),
                Image(image: AssetImage('assets/varanda.jpg')),
                Image(image: AssetImage('assets/varanda.jpg')),
                Image(image: AssetImage('assets/The-Beach.jpg'))
              ],
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration:
                Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ),
        Container(
          padding:  EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 10),
          child: Text(
            'VENUES',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child:Card(
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
                autoPlayAnimationDuration:
                Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ),

        Container(
          padding:  EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 10),
          child: Text(
            'LEISURE',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child:Card(
            child: CarouselSlider(
              items: [
                Image(image: AssetImage('assets/spa_gc.jpg')),
                Image(image: AssetImage('assets/hall2.jpg')),
                Image(image: AssetImage('assets/hall3.jpg'))
              ],
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration:
                Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ),

        Container(
          padding:  EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 10),
          child: Text(
            'ACCOMMODATION',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child:Card(
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
                autoPlayAnimationDuration:
                Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ),
      ],
      ),
      )
      ),
      ),
                ]

      ),
          );
    }
}
