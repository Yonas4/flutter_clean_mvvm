import 'dart:async';

import 'package:flutter_clean_mvvm/domain/Models/models.dart';
import 'package:flutter_clean_mvvm/presentation/Base/base_view_model.dart';

import 'package:flutter_clean_mvvm/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {

  //stream controllers outputs
  final StreamController<SliderViewObj> _streamController =
      StreamController<SliderViewObj>();

  late final List<SliderObject> _list;
  int _currentPageIndex = 0;

  //OnBoarding ViewModel Input
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    //viewModel Start your job
    _list = _getSliderObj();
    _postDataToView();
  }

  @override
  int goNext() {
    var nextIndex = ++_currentPageIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    var previousIndex = --_currentPageIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentPageIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObj => _streamController.sink;

//OnBoarding ViewModel Input
  @override
  Stream<SliderViewObj> get outputSliderViewObj =>
      _streamController.stream.map((sliderViewObj) => sliderViewObj);

//onboarding privet methods

  void _postDataToView() {
    inputSliderViewObj.add(
      SliderViewObj(
        _list[_currentPageIndex],
        _currentPageIndex,
        _list.length,
      ),
    );
  }

  List<SliderObject> _getSliderObj() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onboardingLogo4,
        ),
      ];
}

// inputs mean that "Orders" that our view model will receive from view
abstract class OnBoardingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe left
  int goPrevious(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);

  //stream controller input
  Sink get inputSliderViewObj;
}

abstract class OnBoardingViewModelOutputs {
  //stream controller output
  Stream<SliderViewObj> get outputSliderViewObj;
}
