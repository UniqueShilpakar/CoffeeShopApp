import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';
import '../../data/repositories/product_repository.dart';

class HomeController extends GetxController {
  final RxList<ProductModel> popularProducts  = <ProductModel>[].obs;
  final RxList<CategoryModel> categories      = <CategoryModel>[].obs;
  final RxString selectedCategory             = 'Coffee'.obs;
  final RxBool isLoading                      = true.obs;
  final RxString searchQuery                  = ''.obs;

  final List<Map<String, String>> banners = [
    {'title': '20% off your first order', 'subtitle': 'Use code CAFFORA20', 'bg': 'primary'},
    {'title': 'Free delivery today',      'subtitle': 'On orders above Rs. 500', 'bg': 'accent'},
    {'title': 'New: Cold Brew Series',    'subtitle': 'Try our summer specials', 'bg': 'dark'},
  ];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 800)); // simulate API
    popularProducts.assignAll(ProductRepository.getPopular());
    categories.assignAll(ProductRepository.getCategories());
    isLoading.value = false;
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}