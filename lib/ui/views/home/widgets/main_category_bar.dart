import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/ui/views/home/home_viewmodel.dart';

class MainCategoryBar extends ViewModelWidget<HomeViewModel> {
  const MainCategoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = viewModel.categories[index];
          final bool isSelected = category == viewModel.selectedMainCategories;
          return GestureDetector(
            onTap: () {
              viewModel.selecteMainCategorie(category);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  margin: const EdgeInsets.only(top: 6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.red : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w400,
                      color: isSelected ? Colors.black : Colors.grey.shade600,
                    ),
                  ),
                ),
                // Badge
                Positioned(
                  top: -4,
                  right: -6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? Colors.white : Colors.grey.shade100,
                      border: Border.all(
                        color: isSelected ? Colors.red : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      category.subCategory.length.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
