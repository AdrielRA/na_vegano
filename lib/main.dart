import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        primaryColor: Color(0x0075DF),
        scaffoldBackgroundColor: Color(0xFFF5F1),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color(0x0075DF),
              displayColor: Color(0x0075DF),
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
        iconTheme: IconThemeData(color: Color(0x0075DF)),
      ),
      home: null,
    );
  }
}
