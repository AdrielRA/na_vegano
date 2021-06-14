import 'package:flutter/material.dart';
import 'package:na_vegano/widgets/button_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  itemCart() {
    return Container(
      margin: EdgeInsets.all(8),
      height: 105,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image(
              width: 100,
              height: 100,
              image: AssetImage('lib/assets/images/01.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Legume 1',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text('R\$ 10.00'),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  Text('2'),
                  IconButton(
                    icon: Icon(Icons.remove_circle, size: 30),
                    onPressed: () {},
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image(
              image: AssetImage('lib/assets/images/01.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(25),
            ),
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child: Container(
              alignment: Alignment.center,
              height: 75,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "CARRINHO",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              transform: Matrix4.translationValues(0, -55, 0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return itemCart();
                },
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -20, 0),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Button(
              text: "FINALIZAR COMPRA",
              onPress: () => Navigator.pushNamed(context, '/menu'),
            ),
          )
        ],
      ),
    ));
  }
}
