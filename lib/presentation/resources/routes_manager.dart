import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/App/di.dart';
import 'package:flutter_clean_mvvm/presentation/pages/%20Main/main_view.dart';
import 'package:flutter_clean_mvvm/presentation/pages/Login/view/login_view.dart';
import 'package:flutter_clean_mvvm/presentation/pages/Onboarding/View/onboarding_view.dart';
import 'package:flutter_clean_mvvm/presentation/pages/Register/register_view.dart';
import 'package:flutter_clean_mvvm/presentation/pages/Splash/splash_view.dart';
import 'package:flutter_clean_mvvm/presentation/pages/StoreDiatels/store_deatils_view.dart';
import 'package:flutter_clean_mvvm/presentation/pages/forget%20Pass/forget_pass_view.dart';
import 'package:flutter_clean_mvvm/presentation/resources/strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String onBoardingRoute = '/onBoarding';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

//rout generator
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.registerRoute:
        // initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        // initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgetPassView());
      case Routes.mainRoute:
        // initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        // initStoreDetailsModule();
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound /*.tr()*/),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound /*.tr()*/)),
      ),
    );
  }
}
