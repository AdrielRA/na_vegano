import 'package:flutter/material.dart';
import 'package:na_vegano/models/item_cart.dart';
import 'package:na_vegano/services/firestore_service.dart';
import 'package:na_vegano/widgets/button_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ItemCart> items;

  @override
  void initState() {
    FirestoreService().listenItemsCart((snaps) {
      print((snaps as List<ItemCart>).toList());
      setState(() {
        items = snaps;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    FirestoreService.listen.cancel();
    super.dispose();
  }

  Widget itemCart(ItemCart itemCart) {
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
              image: NetworkImage(itemCart.item.photo),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemCart.item.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text('R\$ ${itemCart.item.price}'),
                  ],
                ),
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      size: 30,
                    ),
                    onPressed: () {
                      FirestoreService().updateQuantityItemCart(itemCart.id, 1);
                    },
                  ),
                  Text(itemCart.quantity.toInt().toString()),
                  IconButton(
                    icon: Icon(Icons.remove_circle, size: 30),
                    onPressed: () {
                      FirestoreService().updateQuantityItemCart(
                        itemCart.id,
                        -1,
                        quantity: itemCart.quantity,
                      );
                    },
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
              image: AssetImage('lib/assets/images/a.jpg'),
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
          items == null
              ? CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                )
              : items == []
                  ? Expanded(
                      child: Center(
                        child: (Text('carrinho vazio')),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        transform: Matrix4.translationValues(0, -55, 0),
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return itemCart(items[index]);
                          },
                        ),
                      ),
                    ),
          Container(
            transform: Matrix4.translationValues(0, -20, 0),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Button(
              text: items != null && items.isNotEmpty
                  ? "FINALIZAR COMPRA"
                  : "VOLTAR",
              onPress: () {
                if (items != null && items.isNotEmpty)
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/checkout', (_) => false);
                else
                  Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    ));
  }
}
