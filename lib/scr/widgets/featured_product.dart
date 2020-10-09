import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/helpers/screen_navigation.dart';
import 'package:farm_tech/scr/models/products.dart';
import 'package:farm_tech/scr/screens/details.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:flutter/material.dart';

List<Product> productList = [
  Product(
      name: 'Apple',
      price: '200',
      qty: '5 kg',
      image: 'a.jpg',
      available: false),
  Product(
      name: 'Grapes',
      price: '200',
      qty: '5 kg',
      image: 'b.jpg',
      available: true),
  Product(
      name: 'Lychee',
      price: '200',
      qty: '5 kg',
      image: 'c.jpg',
      available: true),
  Product(
      name: 'Apple',
      price: '200',
      qty: '5 kg',
      image: 'a.jpg',
      available: false),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                changeScreen(_, Details(product: productList[index]));
              },
              child: Container(
                height: 220,
                width: 180,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red[50],
                      offset: Offset(15, 5),
                      blurRadius: 30,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'images/${productList[index].image}',
                      height: 140,
                      width: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(text: '${productList[index].name}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(1, 1),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: productList[index].available
                                  ? Icon(
                                      Icons.local_grocery_store,
                                      color: Colors.green,
                                      size: 18,
                                    )
                                  : Icon(
                                      Icons.local_grocery_store,
                                      color: red,
                                      size: 18,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: ('RS. ' + productList[index].price),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: productList[index].qty,
                            weight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
