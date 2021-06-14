import 'package:flutter/material.dart';
import 'package:na_vegano/models/item_menu.dart';
import 'package:na_vegano/services/firestore_service.dart';
import 'package:na_vegano/widgets/button_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ItemMenu item;

  @override
  void initState() {
    /*item = ItemMenu(
        id: id,
        fats: "50",
        grams: 60,
        name: "Salada top master",
        photo: "",
        price: 45.90,
        proteins: "40");*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments as String;

    FirestoreService().listenItemById(id, (itemDoc) {
      setState(() {
        item = itemDoc;
      });
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: item == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Image(
                        image: NetworkImage(item.photo),
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
                          Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Text(
                              "R\$${item.price}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    //Icon(Icons.star),
                                    Text(
                                      item.grams.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('gramas')
                                  ],
                                ),
                                Column(
                                  children: [
                                    //Icon(Icons.star),
                                    Text(
                                      item.calories.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('calorias')
                                  ],
                                ),
                                Column(
                                  children: [
                                    // Icon(Icons.star),
                                    Text(
                                      item.proteins.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('proteinas')
                                  ],
                                ),
                                Column(
                                  children: [
                                    // Icon(Icons.star),
                                    Text(
                                      item.fats.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('gorduras')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 30),
                            child: Text(
                              item.description,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Button(
                              text: "Adicionar ao carrinho",
                              onPress: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Button(
                              text: "Voltar",
                              onPress: () {
                                Navigator.pop(context);
                              },
                            ),
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
