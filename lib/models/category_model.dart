class CategoryModel {
  final String image;

  final String categoryName;

  const CategoryModel({required this.image, required this.categoryName});
}
List<CategoryModel> categories = const [
  CategoryModel(image: 'assets/business.avif', categoryName: 'Business'),
  CategoryModel(image: 'assets/entertaiment.avif', categoryName: 'Entertainment'),
  CategoryModel(image: 'assets/general.avif', categoryName: 'General'),
  CategoryModel(image: 'assets/health.avif', categoryName: 'Health'),
  CategoryModel(image: 'assets/science.avif', categoryName: 'Science'),
  CategoryModel(image: 'assets/sports.avif', categoryName: 'Sports'),
  CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'),
];
