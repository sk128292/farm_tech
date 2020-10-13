import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const PRODUCT_ID = "productId";
  static const QTY = "qty";
  static const PRICE = "price";

  String _id;
  String _name;
  String _image;
  String _productId;
  int _qty;
  int _price;

  // getter

  String get id => _id;
  String get name => _name;
  String get image => _image;
  String get productId => _productId;
  int get qty => _qty;
  int get price => _price;

  CartItemModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _name = snapshot.get(NAME);
    _image = snapshot.get(IMAGE);
    _productId = snapshot.get(PRODUCT_ID);
    _qty = snapshot.get(QTY);
    _price = snapshot.get(PRICE);
  }
}
