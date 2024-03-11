import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_mvvm/domain/Models/models.dart';
import 'package:flutter_clean_mvvm/presentation/pages/Onboarding/Viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_clean_mvvm/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/constants_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingVieState();
}

class _OnboardingVieState extends State<OnboardingView> {
  final PageController _controller = PageController();

  final OnBoardingViewModel _boardingViewModel = OnBoardingViewModel();

  void _bind() {
    _boardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _boardingViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObj>(
      stream: _boardingViewModel.outputSliderViewObj,
      builder: (context, snapshot) {
        return _detContentWidget(snapshot.data);
      },
    );
  }

  Widget _detContentWidget(SliderViewObj? sliderViewObj) {
    if (sliderViewObj == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white, //color for statusBar back
            statusBarBrightness: Brightness.dark, //for item in statusBar
          ),
        ),
        body: PageView.builder(
          controller: _controller,
          itemCount: sliderViewObj.numOfSlid,
          onPageChanged: _boardingViewModel.onPageChanged,
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObj.sliderObject);
          },
        ),
        bottomSheet: ColoredBox(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.loginRoute,
                    );
                  },
                ),
              ),
              _getBottomSheet(sliderViewObj),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheet(SliderViewObj sliderViewObj) {
    return ColoredBox(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsetsDirectional.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                //go to previous slid
                _controller.animateToPage(
                  _boardingViewModel.goPrevious(),
                  duration: const Duration(
                    milliseconds: AppConstants.sliderAnimationTime,
                  ),
                  curve: Curves.linear,
                );
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
            ),
          ),
          //circle indicator

          Row(
            children: [
              ...List.generate(
                sliderViewObj.numOfSlid,
                (index) => Padding(
                  padding: const EdgeInsetsDirectional.all(AppPadding.p8),
                  child: _getProperCircle(index, sliderViewObj.currentIndex),
                ),
              ),
            ],
          ),

          //right arrow
          Padding(
            padding: const EdgeInsetsDirectional.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                //go to next slid
                _controller.animateToPage(
                  _boardingViewModel.goNext(),
                  duration: const Duration(
                    milliseconds: AppConstants.sliderAnimationTime,
                  ),
                  curve: Curves.linear,
                );
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._sliderObject, {super.key});

  final SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}
