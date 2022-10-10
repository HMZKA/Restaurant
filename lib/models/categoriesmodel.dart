class CategoriesModel {
  List<Categories> categories = [];
  CategoriesModel.fromJson(Map<String, dynamic> json) {
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

  Categories({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }
}
