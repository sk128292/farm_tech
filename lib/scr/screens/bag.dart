import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/models/products.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  Product product = Product(
      name: 'Apple',
      price: '200',
      qty: '5 kg',
      image: 'a.jpg',
      available: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: "Shopping Bag"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("images/bag.png", width: 20, height: 20),
                ),
                Positioned(
                  right: 7,
                  bottom: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: grey,
                          offset: Offset(2, 1),
                          blurRadius: 3,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: "2",
                        colors: red,
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 120,
              // width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                  color: Colors.red[50],
                  offset: Offset(3, 5),
                  blurRadius: 30,
                ),
              ]),
              child: Row(
                children: [
                  Image.asset(
                    'images/${product.image}',
                    height: 120,
                    width: 120,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: product.name + "\n",
                                style: TextStyle(color: black, fontSize: 20),
                              ),
                              TextSpan(
                                text: product.price + "\n",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 100),
                        IconButton(icon: Icon(Icons.delete), onPressed: null)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
