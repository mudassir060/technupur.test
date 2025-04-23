import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/ui/views/home/home_viewmodel.dart';

class SubCategoryBar extends ViewModelWidget<HomeViewModel> {
  const SubCategoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.subCategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = viewModel.subCategories[index];
          final bool isSelected = item == viewModel.selectedSubCategories;
          return GestureDetector(
            onTap: () {
              viewModel.selectSubCategorie(item);
            },
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.red : Colors.grey.shade400,
                          width: isSelected ? 2.5 : 1.5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(item.image),
                      ),
                    ),
                    Positioned(
                      top: -2,
                      right: -2,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color:
                                isSelected ? Colors.red : Colors.grey.shade400,
                            width: 1.2,
                          ),
                        ),
                        child: Text(
                          item.products.length.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
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
