class HomeModel {
  List<Categories> categories = [];
  HomeModel.fromJson(Map<String, dynamic> json) {
    json['categories'].forEach((v) {
      categories.add(Categories.fromJson(v));
    });
  }
}

class Categories {
  int? id;
  String? title;
  String? description;
  String? image;
  List<Items> items = [];

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    json['items'].forEach((v) {
      items.add(Items.fromJson(v));
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
