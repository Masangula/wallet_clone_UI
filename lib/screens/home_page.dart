import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_wallet/data/models/article_model.dart';
import 'package:e_wallet/data/models/item_model.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9E5F4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            _buildCustomAppBar(),
            const SizedBox(
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...topItemList
                    .map(
                      (item) => _buildHomePageItems(
                        item: item,
                      ),
                    )
                    .toList()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 207,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                ),
                primary: false,
                itemCount: bottomItemsList.length,
                itemBuilder: (context, index) {
                  var item = bottomItemsList[index];
                  return _buildHomePageItems(
                    item: item,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 180,
              alignment: Alignment.center,
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextTitles(
                    title: "Promo dan Info",
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...promoImagesList.map(
                          (imageName) => _buildPromoWidget(
                            imageName: imageName,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: _buildTextTitles(
                        title: "Informasi Menarik",
                      ),
                    ),
                    ...articleItemList.map(
                      (articleItem) =>
                          _buildArticleItem(articleItem: articleItem),
                    ),
                  ]),
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.backup_table_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
//Josh commit first
  Container _buildArticleItem({required ArticleItem articleItem}) {
    return Container(
      height: 225,
      width: 325,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                "assets/images/${articleItem.imagePath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildTextTitles(title: articleItem.title),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(articleItem.description),
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Klik di Sini",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildTextTitles({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Container _buildPromoWidget(
      {required String imageName, required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 125,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Image.asset(
        "assets/images/$imageName",
        fit: BoxFit.fill,
      ),
    );
  }

  Column _buildHomePageItems({required HomePageItem item}) {
    final isTopItem = item.itemType == ItemType.topItem;
    return Column(
      children: [
        CircleAvatar(
          radius: isTopItem ? 24 : 20,
          backgroundColor: isTopItem ? item.color : item.color.withOpacity(0.3),
          child: Icon(
            item.iconData,
            size: isTopItem ? 24 : 20,
            color: isTopItem ? Colors.white : item.color,
          ),
        ),
        SizedBox(
          height: isTopItem ? 12 : 4,
        ),
        Text(
          item.title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        )
      ],
    );
  }

  Padding _buildCustomAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: "TZS.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "3000.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // const Text("TZS3000.00"),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: const TextSpan(
                  text: "SPE Points",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "1.520",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // const Text("SPE Points 1.520"),
            ],
          ),
          SizedBox(
            height: 29,
            width: 39,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
