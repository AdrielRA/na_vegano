import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key key}) : super(key: key);

  cardItemMenu(context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                image: AssetImage('lib/assets/images/01.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'R\$ 5.00',
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                ),
                Text(
                  'Legume 1',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/cart');
      },
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Na’Vegano",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  "Aqui você come bem",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              transform: Matrix4.translationValues(0, -25, 0),
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  cardItemMenu(context),
                  cardItemMenu(context),
                  cardItemMenu(context),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
