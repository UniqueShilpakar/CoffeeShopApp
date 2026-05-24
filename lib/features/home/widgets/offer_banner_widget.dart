import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:flutter/material.dart';


class OfferBannerWidget extends StatefulWidget {
  final List<Map<String, String>> banners;

  const OfferBannerWidget({super.key, required this.banners});

  @override
  State<OfferBannerWidget> createState() => _OfferBannerWidgetState();
}

class _OfferBannerWidgetState extends State<OfferBannerWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Color> _bgColors = [
    AppColors.primary,
    AppColors.accent,
    AppColors.textDark,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.banners.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (context, i) {
              final banner = widget.banners[i];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _bgColors[i % _bgColors.length],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner['title'] ?? '',
                            style: const TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            banner['subtitle'] ?? '',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 13,
                              color: AppColors.white.withOpacity(0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.coffee_rounded,
                        color: Colors.white30, size: 56),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.banners.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _currentPage == i ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: _currentPage == i
                    ? AppColors.primary
                    : AppColors.divider,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}