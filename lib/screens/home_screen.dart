import 'package:flutter/material.dart';
import 'package:na_vegano/widgets/button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage('lib/assets/icons/logo.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "Na'Vegano",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Button(
                text: "Cadastrar",
                onPress: () => Navigator.pushNamed(context, '/register'),
              ),
              Button(
                  text: "Entrar",
                  onPress: () => Navigator.pushNamed(context, '/login')),
            ],
          ),
        ),
      ),
    );
  }
}
