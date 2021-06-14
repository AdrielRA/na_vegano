class UserModel {
  String uid, name, email, street, num, district, city, uf, password;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.street,
      this.num,
      this.district,
      this.city,
      this.uf,
      this.password});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'district': district,
      'street': street,
      'num': num,
      'city': city,
      'uf': uf,
    };
  }
}
