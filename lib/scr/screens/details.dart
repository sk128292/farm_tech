import 'package:carousel_pro/carousel_pro.dart';
import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/helpers/screen_navigation.dart';
import 'package:farm_tech/scr/models/product_model.dart';
import 'package:farm_tech/scr/providers/app_provider.dart';
import 'package:farm_tech/scr/providers/user_provider.dart';
import 'package:farm_tech/scr/screens/cart_screen.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:farm_tech/scr/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final ProductModel product;

  const Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _key = GlobalKey<ScaffoldState>();
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              changeScreen(context, CartScreen());
            },
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: app.isLoading
            ? Loading()
            : Column(children: [
                Container(
                  height: 300,
                  child: Carousel(
                    images: [
                      Image.network(widget.product.image),
                      Image.network(widget.product.image),
                      Image.network(widget.product.image),
                      Image.network(widget.product.image),
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    dotIncreaseSize: 1.5,
                    autoplay: false,
                  ),
                ),
                CustomText(
                  text: widget.product.name,
                  size: 26,
                  weight: FontWeight.bold,
                ),
                CustomText(
                  text: widget.product.price.toString(),
                  size: 26,
                  weight: FontWeight.w600,
                  colors: red,
                ),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: red,
                      size: 36,
                    ),
                    onPressed: () {
                      if (qty != 1) {
                        setState(() {
                          qty -= 1;
                        });
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      app.changeLoading();
                      print("All set loading");
                      bool value = await user.addToCart(
                          product: widget.product, qty: qty);
                      if (value) {
                        print("Item Added to cart");
                        // ignore: deprecated_member_use
                        _key.currentState.showSnackBar(
                          SnackBar(content: Text("Added to Cart")),
                        );
                        user.reloadUserModel();
                        app.changeLoading();
                        return;
                      } else {
                        print("Item not Added to cart");
                      }

                      print("Loading set false");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: red,
                      ),
                      child: app.isLoading
                          ? Loading()
                          : Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(28, 12, 28, 12),
                              child: CustomText(
                                text: "Add $qty To Bag",
                                colors: white,
                                size: 24,
                                weight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: red,
                      size: 36,
                    ),
                    onPressed: () {
                      setState(() {
                        qty += 1;
                      });
                    },
                  ),
                ]),
              ]),
      ),
    );
  }
}
