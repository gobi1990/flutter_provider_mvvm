class Product {
  int id;
  String name;
  String brand;
  String price;
  int availableStock;

  Product({this.id, this.name, this.brand, this.price, this.availableStock});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brand = json['brand'];
    price = json['price'];
    availableStock = json['availableStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['price'] = this.price;
    data['availableStock'] = this.availableStock;
    return data;
  }

  static List<Product> listFromJson(List<dynamic> json) {
    return json == null
        ? List<Product>()
        : json.map((value) => new Product.fromJson(value)).toList();
  }
}
