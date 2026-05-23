import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:flutter/material.dart';


class CafforaInput extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final Widget? suffix;

  const CafforaInput({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'DMSans',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: const TextStyle(
            fontFamily: 'DMSans',
            fontSize: 16,
            color: AppColors.textDark,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: 'DMSans',
              fontSize: 14,
              color: AppColors.textLight,
            ),
            filled: true,
            fillColor: AppColors.inputFill,
            suffixIcon: suffix != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: suffix,
                  )
                : null,
            suffixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 18, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  const BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}