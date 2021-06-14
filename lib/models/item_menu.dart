class ItemMenu {
  String id, name, photo, description, calories, proteins, fats;
  double price, grams;
  ItemMenu(
      {this.id,
      this.name,
      this.price,
      this.photo,
      this.grams,
      this.calories,
      this.proteins,
      this.fats});

  ItemMenu.fromFirestore(Map<String, dynamic> firestoreDocument)
      : id = firestoreDocument['id'],
        name = firestoreDocument['name'],
        price = double.parse(firestoreDocument['price'].toString()),
        photo = firestoreDocument['photo'],
        description = firestoreDocument['description'],
        grams = double.parse(firestoreDocument['grams'].toString()),
        calories = firestoreDocument['calories'],
        proteins = firestoreDocument['proteins'],
        fats = firestoreDocument['fats'];
}
