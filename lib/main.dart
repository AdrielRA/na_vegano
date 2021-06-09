import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
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
        primaryColor: Color(0xFF0075DF),
        scaffoldBackgroundColor: Color(0xFFFFF5F1),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color(0xFF0075DF),
              displayColor: Color(0xFF0075DF),
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
        iconTheme: IconThemeData(color: Color(0xFF0075DF)),
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
