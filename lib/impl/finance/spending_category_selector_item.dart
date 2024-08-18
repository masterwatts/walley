import 'package:flutter/material.dart';
import 'package:walley/impl/finance/spending_category.dart';

class SpendingCategorySelectorItem {
  final SpendingCategory spendingCategory;
  bool isSelected;
  SpendingCategorySelectorItem({required this.spendingCategory})
      : isSelected = false;

  AnimatedContainer render() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInQuad,
      decoration: BoxDecoration(
        color: isSelected
            ? spendingCategory.color.withAlpha(150)
            : spendingCategory.color.withAlpha(40),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 10,
          right: 10,
        ),
        child: Text(spendingCategory.name),
      ),
    );
  }
}
