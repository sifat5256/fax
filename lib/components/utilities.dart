import 'package:auto_route/auto_route.dart';
import 'package:fax/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes/router.dart';

class AutoGridItemModel {
  final String name;
  final String image;

  const AutoGridItemModel({required this.name, required this.image});
}

class RecentsAutoGridItems extends StatelessWidget {
  final List<AutoGridItemModel> items;

  const RecentsAutoGridItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {
            context.pushRoute(FileDetailsRoute(item: item));
          },
          child: GridTile(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.name),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AiToolsItemModel {
  final Color? color;
  final IconData icon;
  final String title;
  final String description;

  const AiToolsItemModel({
    required this.icon,
    required this.title,
    required this.description,
    this.color
  });
}

class AiToolsAutoGridItems extends StatelessWidget {
  final List<AiToolsItemModel> items;

  const AiToolsAutoGridItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = (screenWidth / 150).floor();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.96
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(AppSizes.small),
          ),
          padding: EdgeInsets.symmetric(vertical: AppSizes.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 28,color: item.color,),
              SizedBox(height: AppSizes.small),
              Text(
                item.title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                item.description,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: WidgetStatePropertyAll(Size.zero),
                  visualDensity: VisualDensity.compact,
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.primaryColor,
                  ),
                ),
                child: Text(
                  "Try Now",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ToolbarItem {
  final IconData icon;
  final String label;
  final int index;

  const ToolbarItem({
    required this.icon,
    required this.label,
    required this.index,
  });
}
class CustomToolbarAdvanced extends StatelessWidget {
  final List<ToolbarItem> items;
  final int selected;
  final Function(int) onSelect;
  final double? height;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? iconSize;
  final double? fontSize;

  const CustomToolbarAdvanced({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
    this.height,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.iconSize,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          final isSelected = selected == item.index;
          return Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onSelect(item.index),
                child: Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: isSelected
                            ? (selectedColor ?? AppColors.primaryColor)
                            : (unselectedColor ?? AppColors.grey),
                        size: iconSize ?? 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          color: isSelected
                              ? (selectedColor ?? AppColors.primaryColor)
                              : (unselectedColor ?? AppColors.grey),
                          fontSize: fontSize ?? 12,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
