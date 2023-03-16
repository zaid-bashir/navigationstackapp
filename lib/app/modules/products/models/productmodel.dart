class ProductModel {
  String? name;
  double? price;
  String? description;
  String? imageLink;

  ProductModel({this.name, this.price, this.description, this.imageLink});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['image_link'] = imageLink;
    return data;
  }
}
