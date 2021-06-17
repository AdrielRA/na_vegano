import 'package:flutter/material.dart';
import 'package:na_vegano/screens/home_screen.dart';
import 'package:na_vegano/widgets/button_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image(
                  image: AssetImage("lib/assets/images/06.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "MUITO OBRIGADO!",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Text(
                      "Cansado de se imergir em uma alimentação rasa e sem valores?",
                      style: TextStyle(fontSize: 19),
                    ),
                    Text(
                      "Nós da Na'vegano estamos sempre navegando em mares profundos em busca de o melhor que possamos oferecer.",
                      style: TextStyle(fontSize: 19),
                    ),
                    Text(
                      "Se delicie e viagem em nossa saladas , melhor sem medo de se afogar.",
                      style: TextStyle(fontSize: 19),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Row(
                        children: [
                          Icon(Icons.call),
                          Text('(035)3291-7070'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      child: Row(
                        children: [
                          Icon(Icons.alternate_email),
                          Text('navegano@gmail.com'),
                        ],
                      ),
                    ),
                    Button(
                      text: "concluir",
                      onPress: () => Navigator.pushNamedAndRemoveUntil(
                          context, '/menu', (_) => false),
                    ),
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
