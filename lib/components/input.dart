import 'package:flutter/material.dart';

import '../theme.dart';

class FaxNumberInput extends StatelessWidget {
  final TextEditingController controller;

  const FaxNumberInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = AppColors.surfaceColor; // light grey

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.small)),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          // Prefix: +1 with background
          Container(
            width: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.small),
                bottomLeft: Radius.circular(AppSizes.small),
              ),
              border: Border(right: BorderSide(color: AppColors.borderColor)),
            ),
            child: const Text('+1', style: TextStyle(fontSize: 16)),
          ),

          // Middle: Input Field with border (no left/right border)
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Enter a fax number",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                filled: true,
                fillColor: AppColors.cardColor,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),

          // Suffix: Person Icon with same background
          Container(
            width: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: const BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSizes.small),
                bottomRight: Radius.circular(AppSizes.small),
              ),
              border: Border(left: BorderSide(color: AppColors.borderColor)),
            ),
            child: const Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
