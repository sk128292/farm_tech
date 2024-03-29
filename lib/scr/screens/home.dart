import 'package:carousel_pro/carousel_pro.dart';
import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/helpers/screen_navigation.dart';
import 'package:farm_tech/scr/providers/app_provider.dart';
import 'package:farm_tech/scr/providers/category_provider.dart';
import 'package:farm_tech/scr/providers/product_provider.dart';
import 'package:farm_tech/scr/providers/user_provider.dart';
import 'package:farm_tech/scr/screens/cart_screen.dart';
import 'package:farm_tech/scr/screens/category_product_screen.dart';
import 'package:farm_tech/scr/screens/order.dart';
import 'package:farm_tech/scr/screens/product_searched_screen.dart';
import 'package:farm_tech/scr/widgets/ad.dart';
import 'package:farm_tech/scr/widgets/categories.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:farm_tech/scr/widgets/featured_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final authProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: black,
        title: CustomText(
          text: "Farm Tech",
          colors: white,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () {
                  changeScreen(context, CartScreen());
                },
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              accountName: CustomText(
                text: authProvider.userModel?.name ?? "username loading...",
                colors: white,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: authProvider.userModel?.email ?? "email loading...",
                colors: grey,
                weight: FontWeight.bold,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: "Home", align: TextAlign.left),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.person),
              title: CustomText(text: "Account", align: TextAlign.left),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartScreen());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart", align: TextAlign.left),
            ),
            ListTile(
              onTap: () async {
                await user.getOrders();
                changeScreen(context, OrderScreen());
              },
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My Order", align: TextAlign.left),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.logout),
              title: CustomText(text: "Log Out", align: TextAlign.left),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: black,
                // borderRadius: BorderRadius.only(
                //     bottomRight: Radius.circular(20),
                //     bottomLeft: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                  bottom: 15,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.search, color: red),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern) async {
                        app.changeLoading();
                        await productProvider.search(productName: pattern);
                        changeScreen(context, ProductSearchedScreen());
                        app.changeLoading();
                      },
                      decoration: InputDecoration(
                        hintText: 'Find What you want',
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: Icon(Icons.filter_list, color: red),
                  ),
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
            Container(
              height: 162,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryProvider.categories.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () async {
                      await productProvider.loadProductsByCategory(
                          categoryName:
                              categoryProvider.categories[index].name);
                      changeScreen(
                        context,
                        CategoryProductScreen(
                          categoryModel: categoryProvider.categories[index],
                        ),
                      );
                    },
                    child: Categories(
                      category: categoryProvider.categories[index],
                    ),
                  );
                },
              ),
            ),
            // Categories(),
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
    );
  }
}
