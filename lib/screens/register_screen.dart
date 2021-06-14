import 'package:flutter/material.dart';
import 'package:na_vegano/widgets/button_widget.dart';
import 'package:na_vegano/widgets/input_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image(
                      image: AssetImage('lib/assets/images/01.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 175,
                    height: 50,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    top: 182.5,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "CADASTRE-SE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Input(text: "Nome"),
                    Input(text: "E-mail"),
                    Input(
                      text: "Senha",
                      obscureText: true,
                    ),
                    Input(
                      text: "Confirmar senha",
                      obscureText: true,
                    ),
                    Button(
                      text: "Cadastrar",
                      onPress: () => Navigator.pushNamed(context, '/login'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
