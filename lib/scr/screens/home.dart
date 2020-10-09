import 'package:carousel_pro/carousel_pro.dart';
import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/helpers/screen_navigation.dart';
import 'package:farm_tech/scr/screens/bag.dart';
import 'package:farm_tech/scr/widgets/ad.dart';
import 'package:farm_tech/scr/widgets/botton_navigation_icons.dart';
import 'package:farm_tech/scr/widgets/categories.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:farm_tech/scr/widgets/featured_product.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'What would you like.',
                    size: 18,
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.search, color: red),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find What you want',
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: Icon(Icons.filter_list, color: red),
                ),
              ),
            ),
            // SizedBox(height: 5),
            Container(
              height: 190,
              child: Carousel(
                boxFit: BoxFit.cover,
                images: [
                  AssetImage('images/a.jpg'),
                  AssetImage('images/grapesbanner.jpg'),
                  AssetImage('images/lycheebanner.jpg'),
                  AssetImage('images/pearsbanner.jpg'),
                  AssetImage('images/vegetablesbanner.jpg'),
                ],
                dotSize: 4.0,
                // dotSpacing: 15.0,
                dotColor: Colors.pink[300],
                indicatorBgPadding: 5.0,
                autoplay: true,
                autoplayDuration: Duration(seconds: 8),
                animationCurve: Curves.easeIn,
                animationDuration: Duration(seconds: 2),
              ),
            ),
            Categories(),
            // SizedBox(height: 5),
            Advertise(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: 'Featured', size: 20, colors: grey),
            ),
            Featured(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: white,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavIcon(
              onTap: () {},
              image: "home.png",
              name: 'Home',
            ),
            BottomNavIcon(
              onTap: () {
                changeScreen(context, ShoppingBag());
              },
              image: "bag.png",
              name: 'Bag',
            ),
            BottomNavIcon(
              onTap: () {},
              image: "person.png",
              name: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
