import 'package:coffee_shpo/core/constatnts/app_assets.dart';
import 'package:coffee_shpo/data/models/category_model.dart';
import 'package:coffee_shpo/data/models/product_model.dart';


class ProductRepository {
  // Mock data — replace with API calls later
  static List<ProductModel> getAllProducts() => [
    const ProductModel(
      id: '1',
      name: 'Espresso',
      description: 'Rich, bold shot of pure coffee perfection.',
      price: 250,
      category: 'Coffee',
      rating: 4.9,
      reviewCount: 320,
      imageAsset: AppAssets.espresso,
      prepTimeMinutes: 3,
      isPopular: true,
    ),
    const ProductModel(
      id: '2',
      name: 'Latte',
      description: 'Smooth espresso with silky steamed milk.',
      price: 350,
      category: 'Coffee',
      rating: 4.8,
      reviewCount: 210,
      imageAsset: AppAssets.latte,
      prepTimeMinutes: 5,
      isPopular: true,
    ),
    const ProductModel(
      id: '3',
      name: 'Cappuccino',
      description: 'Classic Italian coffee with velvety foam.',
      price: 320,
      category: 'Coffee',
      rating: 4.7,
      reviewCount: 180,
      imageAsset: AppAssets.cappuccino,
      prepTimeMinutes: 5,
    ),
    const ProductModel(
      id: '4',
      name: 'Cold Brew',
      description: 'Slow-steeped for 12 hours, served ice cold.',
      price: 380,
      category: 'Coffee',
      rating: 4.9,
      reviewCount: 150,
      imageAsset: AppAssets.coldBrew,
      prepTimeMinutes: 2,
      isPopular: true,
    ),
    const ProductModel(
      id: '5',
      name: 'Chocolate Cake',
      description: 'Decadent layers of rich chocolate sponge.',
      price: 450,
      category: 'Cakes',
      rating: 4.8,
      reviewCount: 95,
      imageAsset: AppAssets.chocolateCake,
      prepTimeMinutes: 0,
      isPopular: true,
    ),
    const ProductModel(
      id: '6',
      name: 'Croissant',
      description: 'Buttery, flaky layers baked fresh daily.',
      price: 200,
      category: 'Pastries',
      rating: 4.6,
      reviewCount: 130,
      imageAsset: AppAssets.croissant,
      prepTimeMinutes: 0,
    ),
    const ProductModel(
      id: '7',
      name: 'Butter Biscuit',
      description: 'Crisp, golden biscuits with a buttery finish.',
      price: 150,
      category: 'Biscuits',
      rating: 4.5,
      reviewCount: 80,
      imageAsset: AppAssets.biscuit,
      prepTimeMinutes: 0,
    ),
  ];

  static List<ProductModel> getByCategory(String category) =>
      getAllProducts().where((p) => p.category == category).toList();

  static List<ProductModel> getPopular() =>
      getAllProducts().where((p) => p.isPopular).toList();

  static List<ProductModel> search(String query) =>
      getAllProducts()
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

  static List<CategoryModel> getCategories() => [
    const CategoryModel(id: '1', name: 'Coffee',   imageAsset: AppAssets.catCoffee),
    const CategoryModel(id: '2', name: 'Cakes',    imageAsset: AppAssets.catCakes),
    const CategoryModel(id: '3', name: 'Pastries', imageAsset: AppAssets.catPastries),
    const CategoryModel(id: '4', name: 'Biscuits', imageAsset: AppAssets.catBiscuits),
  ];
}