class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final double rating;
  final int reviewCount;
  final String imageAsset;
  final int prepTimeMinutes;
  final bool isPopular;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.imageAsset,
    required this.prepTimeMinutes,
    this.isPopular = false,
  });
}