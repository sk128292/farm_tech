import 'package:farm_tech/scr/providers/app_provider.dart';
import 'package:farm_tech/scr/providers/category_provider.dart';
import 'package:farm_tech/scr/providers/product_provider.dart';
import 'package:farm_tech/scr/providers/user_provider.dart';
import 'package:farm_tech/scr/screens/home.dart';
import 'package:farm_tech/scr/screens/login.dart';
import 'package:farm_tech/scr/widgets/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
        title: 'Farm Tech',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ScreenController(),
      ),
    ),
  );
}

class ScreenController extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}
