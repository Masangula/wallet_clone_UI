import 'package:e_wallet/data/data.dart';
import 'package:flutter/material.dart';

class HomePageItem {
  final String title;
  final Color color;
  final IconData iconData;
  final ItemType itemType;

  const HomePageItem({
    required this.color,
    required this.iconData,
    required this.itemType,
    required this.title,
  });
}
