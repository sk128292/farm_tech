import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const QTY = "qty";

  String _id;
  String _name;
  String _image;
  double _price;
  String _category;
  bool _featured;
  double _qty;

  // getter

  String get id => _id;
  String get name => _name;
  String get image => _image;
  String get category => _category;
  double get price => _price;
  double get qty => _qty;
  bool get featured => _featured;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _name = snapshot.get(NAME);
    _image = snapshot.get(IMAGE);
    _category = snapshot.get(CATEGORY);
    _price = snapshot.get(PRICE);
    _qty = snapshot.get(QTY);
    _featured = snapshot.get(FEATURED);
  }
}
