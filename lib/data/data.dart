import 'package:e_wallet/data/models/article_model.dart';
import 'package:e_wallet/data/models/item_model.dart';
import 'package:flutter/material.dart';

enum ItemType {
  topItem,
  bottomItem,
}

List<HomePageItem> topItemList = const [
  HomePageItem(
    itemType: ItemType.topItem,
    title: "Top-up",
    color: Colors.blue,
    iconData: Icons.add_a_photo_rounded,
  ),
  HomePageItem(
    itemType: ItemType.topItem,
    title: "Transfer",
    color: Colors.red,
    iconData: Icons.request_page_rounded,
  ),
  HomePageItem(
    itemType: ItemType.topItem,
    title: "Request",
    color: Colors.yellow,
    iconData: Icons.access_alarm_outlined,
  ),
  HomePageItem(
    itemType: ItemType.topItem,
    title: "Riwayat",
    color: Colors.green,
    iconData: Icons.receipt,
  ),
];

List<HomePageItem> bottomItemsList = const [
  HomePageItem(
    itemType: ItemType.bottomItem,
    title: "Listrik",
    color: Colors.blue,
    iconData: Icons.add_a_photo_rounded,
  ),
  HomePageItem(
    itemType: ItemType.bottomItem,
    title: "Pusla",
    color: Colors.red,
    iconData: Icons.request_page_rounded,
  ),
  HomePageItem(
    itemType: ItemType.bottomItem,
    title: "Angsuran",
    color: Colors.purple,
    iconData: Icons.receipt,
  ),
  HomePageItem(
    itemType: ItemType.bottomItem,
    title: "M-Tix",
    color: Colors.teal,
    iconData: Icons.tips_and_updates,
  ),
  HomePageItem(
    itemType: ItemType.bottomItem,
    title: "TV Digital & Internet",
    color: Colors.orange,
    iconData: Icons.tv,
  ),
  HomePageItem(
    itemType: ItemType.bottomItem,
    title: "Games",
    color: Colors.purple,
    iconData: Icons.games_rounded,
  ),
  HomePageItem(
    itemType: ItemType.bottomItem,
    title: "BPJS",
    color: Colors.green,
    iconData: Icons.private_connectivity_outlined,
  ),
  HomePageItem(
    itemType: ItemType.bottomItem,
    title: "Semua",
    color: Colors.indigo,
    iconData: Icons.category,
  ),
];

List<String> promoImagesList = const [
  "promo3.png",
  "promo1.png",
  "promo2.png",
];

List<ArticleItem> articleItemList = const [
  ArticleItem(
      title: "Cerdas Finansil",
      description: "Ayo ubah hidupmu bersama SPE e-Wallet",
      imagePath: "article1.png"),
  ArticleItem(
      title: "Cerdas Finansil",
      description: "Ayo ubah hidupmu bersama SPE e-Wallet",
      imagePath: "article2.png"),
  ArticleItem(
      title: "Cerdas Finansil",
      description: "Ayo ubah hidupmu bersama SPE e-Wallet",
      imagePath: "article3.png"),
];

List<IconData> iconList = [
  Icons.home_max_rounded,
  Icons.receipt_long,
  Icons.email,
  Icons.person_2_rounded,
];
