import 'package:flutter/material.dart';

class SelectableCategoryTile extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableCategoryTile({
    required this.categoryName,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.yellow : Colors.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categoryName, style: isSelected ? TextStyle(fontWeight: FontWeight.bold) : null),
            ),
          ],
        ),
      ),
    );
  }
}
