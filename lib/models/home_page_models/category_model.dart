class CategoryModel {

  String? id;
  String? title;

  CategoryModel({
    required this.id,
    required this.title,
  });

  CategoryModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
  }

}