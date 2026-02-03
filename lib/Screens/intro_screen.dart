import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../class/colors.dart';
import '../class/fonts.dart';
import 'Login.dart';

class intro_screen extends StatefulWidget {
  const intro_screen({super.key});

  static const String routeNamed = 'introScreen';

  @override
  State<intro_screen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<intro_screen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/intro/hot-trending 1.png',
      'imageDark': 'assets/images/intro/dark/hot-trending.png',
      'title': 'Titleintro1',
      'body': 'TitleSubintro1',
    },
    {
      'image': 'assets/images/intro/manager-desk 2.png',
      'imageDark': 'assets/images/intro/dark/being-creative.png',
      'title': 'Titleintro2',
      'body': 'TitleSubintro2',
    },
    {
      'image': 'assets/images/intro/being-creative3.png',
      'imageDark': 'assets/images/intro/dark/manager-desk.png',
      'title': 'Titleintro3',
      'body': 'TitleSubintro3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isLast = currentIndex == pages.length - 1;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex == 0
                      ? const SizedBox(width: 40)
                      : IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                  Image.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? 'assets/images/logo.png'
                        : "assets/images/logo in dark.png",
                    height: 32,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Login.routeNamed);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? Colors.white
                                : AppColor.mainColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 32,
                          width: 62,
                        ),
                        Text(
                          'skip'.tr(),
                          style: AppFont.regular16.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Pages
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            Theme.of(context).brightness == Brightness.light?
                            pages[index]['image']! :
                            pages[index]['imageDark']!,
                            height: 260,
                          ),
                        ),
                        // Dots
                        Center(
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count: pages.length,
                            effect: WormEffect(
                              dotHeight: 9,
                              dotWidth: 9,
                              activeDotColor:
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColor.mainColor
                                  : AppColor.mainColorDark,
                              dotColor:
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.grey
                                  : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          pages[index]['title']!.tr(),
                          style: AppFont.Bold20.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          pages[index]['body']!.tr(),
                          style: AppFont.regular16.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (isLast) {
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                    Navigator.pushReplacementNamed(context, Login.routeNamed);
                  },
                  child: Text(
                    isLast ? 'intro finish'.tr() : 'intro next'.tr(),
                    style: AppFont.Bold20.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
