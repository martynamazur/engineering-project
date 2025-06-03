import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/season.dart';



class SelectableSeasonTile extends StatelessWidget {

  final VoidCallback onTap;
  final Season season;
  final bool isSelected;


  const SelectableSeasonTile({super.key,
    required this.onTap,
    required this.season,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.transparent,
                width: 2
              ),
              borderRadius: BorderRadius.circular(8),
              color: isSelected ? Colors.yellow : Colors.grey,
            ),
              child: Image.asset(season.seasonImagePath, width: 100, height: 100)),
          Text(season.seasonName),
        ],
      ),
    );
  }
}