import 'package:flutter/material.dart';
import 'package:na_vegano/models/item_menu.dart';
import 'package:na_vegano/services/firestore_service.dart';

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
        body: SafeArea(
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
                      Text(
                        "R\$${item.price}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    ));
  }
}
