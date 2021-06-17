import 'package:flutter/cupertino.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final Color color;

  const Category({this.id, this.name, this.image, this.color});
}

class CategoryList {
  static List<Category> list() {
    const data = <Category> [
      Category(
        id: 1,
        name: 'Technology',
        image: 'assets/images/category/1.png',
        color: Color(0xffE8F1FC)
      ),
      Category(
          id: 2,
          name: 'Language',
          image: 'assets/images/category/2.png',
          color: Color(0xffFEF4EB)
      ),
      Category(
          id: 3,
          name: 'Art & Design',
          image: 'assets/images/category/3.png',
          color: Color(0xffE5F9FB)
      ),
      Category(
          id: 4,
          name: 'Business',
          image: 'assets/images/category/4.png',
          color: Color(0xffF0ECFD)
      ),
    ];
    return data;
}
}