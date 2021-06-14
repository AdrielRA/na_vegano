import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:na_vegano/screens/cart_screen.dart';
import 'package:na_vegano/screens/checkout_screen.dart';
import 'package:na_vegano/screens/details_screen.dart';
import 'package:na_vegano/screens/home_screen.dart';
import 'package:na_vegano/screens/login_screen.dart';
import 'package:na_vegano/screens/menu_screen.dart';
import 'package:na_vegano/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Na'Vegano",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0CD174),
        scaffoldBackgroundColor: Color(0xFFF1F1F1),
        fontFamily: 'Poppins',
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Color(0xFF222222),
            displayColor: Color(0xFF222222),
            fontFamily: 'Poppins'),
        iconTheme: IconThemeData(color: Color(0xFF23FA7D)),
        buttonColor: Color(0xFFE8385E),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => HomeScreen(),
        "/cart": (context) => CartScreen(),
        "/checkout": (context) => CheckoutScreen(),
        "/details": (context) => DetailsScreen(),
        "/login": (context) => LoginScreen(),
        "/menu": (context) => MenuScreen(),
        "/register": (context) => RegisterScreen(),
      },
    );
  }
}
