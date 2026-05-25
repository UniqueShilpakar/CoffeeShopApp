import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';
import '../../data/repositories/product_repository.dart';

class MenuScreenController extends GetxController {
  final RxList<ProductModel> products    = <ProductModel>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxString selectedCategory        = 'All'.obs;
  final RxString searchQuery             = ''.obs;
  final RxBool isLoading                 = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    categories.assignAll([
      const CategoryModel(id: '0', name: 'All', imageAsset: ''),
      ...ProductRepository.getCategories(),
    ]);
    filterByCategory('All');
    isLoading.value = false;
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      products.assignAll(ProductRepository.getAllProducts());
    } else {
      products.assignAll(ProductRepository.getByCategory(category));
    }
  }

  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filterByCategory(selectedCategory.value);
    } else {
      products.assignAll(ProductRepository.search(query));
    }
  }
}