import 'package:farm_tech/scr/models/product_model.dart';
import 'package:farm_tech/scr/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProduct extends StatelessWidget {
  final ProductModel product;

  const CategoryProduct({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context)
          //     .pushNamed(DetailPage.routeName, arguments: widget.id);
        },
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 125,
              child: Image.network(product.image, fit: BoxFit.contain),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(product.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    // Text("Price: " + this.price.toString()),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          // height: 15,
                          width: 190,
                          child: DropdownButton(
                            isExpanded: true,
                            disabledHint: Text(product.qty),
                            items: null,
                            onChanged: null,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              product.price,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                  fontSize: 13),
                            ),
                            Text(
                              product.price,
                              style:
                                  TextStyle(color: Colors.green, fontSize: 15),
                            )
                          ],
                        ),
                        // if (cart.items.containsKey(prdcts.id))
                        //   MaterialButton(
                        //     minWidth: 145,
                        //     color: Colors.red[400],
                        //     onPressed: () {
                        //       Scaffold.of(context).showSnackBar(SnackBar(
                        //         duration: Duration(seconds: 1),
                        //         content: Text('Item Removed from Cart'),
                        //       ));
                        //       cart.removeItem(prdcts.id);
                        //     },
                        //     child: Text(
                        //       "Remove",
                        //       style: TextStyle(color: Colors.white),
                        //     ),
                        //   )
                        // else
                        //   MaterialButton(
                        //     minWidth: 145,
                        //     color: Colors.lightGreen,
                        //     onPressed: () {
                        //       Scaffold.of(context).showSnackBar(SnackBar(
                        //         duration: Duration(seconds: 1),
                        //         content: Text('Item Added to Cart'),
                        //       ));
                        //       cart.addItem(
                        //     },
                        //     child: Text('Add'),
                        //   ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
