import 'package:farm_tech/scr/models/user_model.dart';
import 'package:farm_tech/scr/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  // getters

  Status get status => _status;
  UserModel get userModel => _userModel;
  User get user => _user;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges();
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<void> signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((user) {
        Map<String, dynamic> values = {
          "name": name.text,
          "email": email.text,
          "id": user.user.uid
        };
        _userServices.createUser(values);
      });
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<void> authStateChanges(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

  // general Methods..

  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print(" We got an error $error");
    return false;
  }

  void cleanControllers() {
    email.text = "";
    password.text = "";
    name.text = "";
  }
}
