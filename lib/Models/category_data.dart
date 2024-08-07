class Category {
  final String title;
  final String image;
  Category({required this.title, required this.image});
}

final List<Category> categories = [
  Category(title: "All", image: "images/all.png"),
  Category(title: "Shoes", image: "images/shoes.png"),
  Category(title: "Beuty", image: "images/beauty.png"),
  Category(title: "Women's\nfashion", image: "images/image1.png"),
  Category(title: "Men's\nfashion", image: "images/men.png"),
  Category(title: "Jewelry", image: "images/jewelry.png"),
];
