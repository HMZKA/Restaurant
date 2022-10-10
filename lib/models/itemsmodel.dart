class ItemsModel {
  List<Items>? items;
  ItemsModel.fromJson(Map<String, dynamic> json) {
    json['items'].forEach((v) {
      items?.add(Items.fromJson(v));
    });
  }
}

class Items {
  int? id;
  String? title;
  String? description;
  String? image;
  int? price;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Items({
    this.id,
    this.title,
    this.description,
    this.image,
    this.price,
    this.categoryId,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    categoryId = json['category_id'];
  }
}
