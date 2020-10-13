import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const PRODUCT_ID = "productId";
  static const USER_ID = "userId";
  static const AMOUNT = "amount";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _description;
  String _productId;
  String _userId;
  String _status;
  int _createdAt;
  int _amount;

  // getters

  String get id => _id;
  String get description => _description;
  String get productId => _productId;
  String get userId => _userId;
  String get status => _status;
  int get amount => _amount;
  int get cratedAt => _createdAt;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _description = snapshot.get(DESCRIPTION);
    _productId = snapshot.get(PRODUCT_ID);
    _userId = snapshot.get(USER_ID);
    _status = snapshot.get(STATUS);
    _amount = snapshot.get(AMOUNT);
    _createdAt = snapshot.get(CREATED_AT);
  }
}
