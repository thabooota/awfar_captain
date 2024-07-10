import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/networking/local/prefs_manager.dart';
import '../../../core/networking/local/shared_preferences.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../models/page_view_item_model.dart';
import 'widgets/page_view_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  late CrossFadeState _crossFadeState;
  int pageIndex = 0;
  double currentPageValue = 0.0;
  List<PageViewItemModel> onboardingItems = [
    PageViewItemModel(
      title:LocaleKeys.onboardingScreenOneTitle.tr(),
      image: AssetsManager.imgOnboardingOne,
    ),
    PageViewItemModel(
      title: LocaleKeys.onboardingScreenTwoTitle.tr(),
      image: AssetsManager.imgOnboardingTwo,
    ),
  ];

  @override
  void initState() {
    super.initState();
    prepareInit();
  }

  void prepareInit() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;
      });
    });

    _crossFadeState = CrossFadeState.showFirst;

    SharedPreferencesManager.saveData(
      key: PrefsManager.onboarding,
      value: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 35.0,
            right: 35.0,
            top: 95.0,
            bottom: 70.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int page) {
                    setState(() {
                      pageIndex = page;
                      if (pageIndex == onboardingItems.length - 1) {
                        _crossFadeState = CrossFadeState.showSecond;
                      } else {
                        _crossFadeState = CrossFadeState.showFirst;
                      }
                    });
                  },
                  controller: _pageController,
                  itemCount: onboardingItems.length,
                  itemBuilder: (BuildContext context, int index) =>
                      PageViewItem(
                    item: onboardingItems[index],
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: const WormEffect(
                  activeDotColor: ColorManager.blue,
                  dotColor: ColorManager.lighterGrey,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
              verticalSpace(20.0.h),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: AppTextButton(
                  onTap: () {
                    context.pushNamedAndRemoveUntil(
                      Routes.register,
                      predicate: (_) => false,
                    );
                  },
                  appText: LocaleKeys.btnNext.tr(),
                ),
                crossFadeState: _crossFadeState,
                duration: const Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
