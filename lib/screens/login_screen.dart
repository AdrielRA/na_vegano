import 'package:flutter/material.dart';
import 'package:na_vegano/widgets/button_widget.dart';
import 'package:na_vegano/widgets/input_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 210,
                  child: Image(image: AssetImage('lib/assets/icons/logo.png')),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Text(
                    "Na'Vegano",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Input(
                  text: 'Email',
                ),
                Input(
                  text: 'Senha',
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Button(
                    text: "ENTRAR",
                    onPress: () => Navigator.pushNamed(context, '/menu'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
