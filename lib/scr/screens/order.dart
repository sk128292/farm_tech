import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/models/order_model.dart';
// import 'package:farm_tech/scr/providers/app_provider.dart';
import 'package:farm_tech/scr/providers/user_provider.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    // final app = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: ListView.builder(
        itemCount: user.orders.length,
        itemBuilder: (_, index) {
          OrderModel _order = user.orders[index];
          return ListTile(
            leading: Text(
              "${_order.totalAmount.toString()}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Text(_order.description),
            subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.cratedAt)
                .toString()),
            trailing: Text(
              _order.status,
              style: TextStyle(color: green),
            ),
          );
        },
      ),
    );
  }
}
