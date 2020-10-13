import 'package:carousel_pro/carousel_pro.dart';
import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/models/product_model.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final ProductModel product;

  const Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 300,
            child: Stack(children: [
              Carousel(
                images: [
                  AssetImage('images/${widget.product.image}'),
                  AssetImage('images/${widget.product.image}'),
                  AssetImage('images/${widget.product.image}'),
                  AssetImage('images/${widget.product.image}'),
                ],
                dotBgColor: white,
                dotColor: grey,
                dotIncreasedColor: red,
                dotIncreaseSize: 1.5,
                autoplay: false,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Stack(children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: black,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: grey, offset: Offset(2, 1), blurRadius: 3),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: CustomText(
                        text: "2",
                        colors: red,
                      ),
                    ),
                  ),
                ]),
              ]),
            ]),
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
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: red,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                  child: CustomText(
                    text: "Add To Bag",
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
              onPressed: () {},
            ),
          ]),
        ]),
      ),
    );
  }
}
