import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/providers/product_provider.dart';
import 'package:farm_tech/scr/widgets/category_product.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(text: "Products", size: 20),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: productProvider.productsSearched.length < 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: grey,
                      size: 30,
                    ),
                    SizedBox(height: 15),
                    CustomText(
                      text: "No Products Found",
                      colors: grey,
                      weight: FontWeight.w300,
                      size: 22,
                    )
                  ],
                ),
              ],
            )
          : ListView.builder(
              itemCount: productProvider.productsSearched.length,
              itemBuilder: (context, index) {
                return CategoryProduct(
                  product: productProvider.productsSearched[index],
                );
              },
            ),
    );
  }
}
