import 'package:flutter/material.dart';
import 'package:ui_grocery_app/model/category_models.dart';
import 'package:ui_grocery_app/ui/screens/screens.dart';
import 'package:ui_grocery_app/ui/theme/colors.dart';

class CategoryWidgt extends StatelessWidget {
  const CategoryWidgt({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List<Category> category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      // padding: EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomCatgoryWidget(category: category[index]);
        },
      ),
    );
  }
}

class CustomCatgoryWidget extends StatelessWidget {
  final Category category;

  const CustomCatgoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 6),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CatalogScreen(category: category)));
            },
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: lightFontGrey2,
                borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                  image: AssetImage(category.imgC),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(
              color: lightFontDark,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
