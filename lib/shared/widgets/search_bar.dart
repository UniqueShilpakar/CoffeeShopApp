import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:flutter/material.dart';


class CafforaSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;

  const CafforaSearchBar({
    super.key,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.inputFill,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.search_rounded,
                color: AppColors.textLight, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: readOnly
                  ? const Text(
                      'Search coffee, desserts...',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    )
                  : TextField(
                      onChanged: onChanged,
                      style: const TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        color: AppColors.textDark,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Search coffee, desserts...',
                        hintStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          color: AppColors.textLight,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}