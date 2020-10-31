import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/providers/app_provider.dart';
import 'package:farm_tech/scr/providers/user_provider.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:farm_tech/scr/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Shopping Cart"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: app.isLoading
          ? Loading()
          : ListView.builder(
              itemCount: user.userModel.cart.length,
              itemBuilder: (_, index) {
                print(
                    'The Price is : ${user.userModel.cart[index]["price"].toString()}');
                print(
                    'The qty is : ${user.userModel.cart[index]["qty"].toString()}');

                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 120,
                    // width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red[50],
                          offset: Offset(3, 5),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          child: Image.network(
                            user.userModel.cart[index]["image"],
                            height: 120,
                            width: 130,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: user.userModel.cart[index]["name"] +
                                          "\n",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: user.userModel.cart[index]["price"]
                                              .toString() +
                                          "\n\n",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    TextSpan(
                                      text: "Quantity : " + "\n",
                                      style: TextStyle(
                                          color: grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextSpan(
                                      text: user.userModel.cart[index]["qty"]
                                          .toString(),
                                      style: TextStyle(
                                          color: red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(width: 90),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: red,
                                ),
                                onPressed: () async {
                                  app.changeLoading();
                                  bool value = await user.removeFromCart(
                                      cartItem: user.userModel.cart[index]);
                                  if (value) {
                                    user.reloadUserModel();
                                    print("Item Removed from cart");
                                    _key.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text("Removed from Cart"),
                                      ),
                                    );
                                    app.changeLoading();
                                    return;
                                  } else {
                                    print("Item is not removed");
                                    app.changeLoading();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        color: Colors.grey[300],
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Total: ",
                      style: TextStyle(
                          color: black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: user.userModel.totalCartAmount.toString(),
                      style: TextStyle(
                          color: red,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: green,
                ),
                child: FlatButton(
                    onPressed: () {},
                    child: CustomText(
                      text: "Pay Now",
                      size: 18,
                      colors: white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
