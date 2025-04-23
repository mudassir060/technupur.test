import 'package:test/app/app.locator.dart';
import 'package:test/model/category.dart';
import 'package:test/services/api_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  List<MainCategory> _categories = [];
  MainCategory? selectedMainCategories;
  SubCategory? selectedSubCategories;

  List<MainCategory> get categories => _categories;
  List<SubCategory> get subCategories =>
      selectedMainCategories?.subCategory ?? [];
  List<Product> get products => selectedSubCategories?.products ?? [];

  onViewModelReady() {
    _loadCategories();
  }

  selecteMainCategorie(MainCategory category) {
    selectedMainCategories = category;
    selectedSubCategories = category.subCategory.first;
    notifyListeners();
  }

  selectSubCategorie(SubCategory subCategory) {
    selectedSubCategories = subCategory;
    notifyListeners();
  }

  Future<void> _loadCategories() async {
    setBusy(true);
    final categories = await _apiService.fetchCategories();
    _categories = categories;
    selectedMainCategories = categories.first;
    selectedSubCategories = selectedMainCategories?.subCategory.first;
    setBusy(false);
    notifyListeners();
  }
}
