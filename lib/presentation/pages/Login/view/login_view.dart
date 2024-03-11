import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/App/di.dart';
import 'package:flutter_clean_mvvm/presentation/pages/Login/viewModel/login_viewmodel.dart';
import 'package:flutter_clean_mvvm/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();

  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _loginViewModel.start(); // start your jop

    _userNameEditingController.addListener(() {
      _loginViewModel.setUserName(_userNameEditingController.text);
    });

    _passwordEditingController.addListener(() {
      _loginViewModel.setPassword(_passwordEditingController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsetsDirectional.only(top: AppPadding.p100.h),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage(ImageAssets.splashLogo),
                  ),
                ),
                SizedBox(
                  height: AppSize.s28.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: AppPadding.p28.w, end: AppPadding.p28.w),
                  child: StreamBuilder<bool>(
                    stream: _loginViewModel.outIsUserNameValid,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameEditingController,
                        decoration: InputDecoration(
                          hintText: AppStrings.username,
                          labelText: AppStrings.username,
                          errorText: (snapshot.data ?? true
                              ? null
                              : AppStrings.usernameError),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.s28.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: AppPadding.p28.w,
                    end: AppPadding.p28.w,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _loginViewModel.outIsPasswordValid,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordEditingController,
                        decoration: InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText: (snapshot.data ?? true
                              ? null
                              : AppStrings.passwordError),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.s28.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: AppPadding.p28.w,
                    end: AppPadding.p28.w,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _loginViewModel.outAreAllInputsValid,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40.h,
                        child: ElevatedButton(
                          onPressed: snapshot.data ?? false
                              ? _loginViewModel.login
                              : null,
                          child: const Text(AppStrings.login),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: AppSize.s8.h,
                      start: AppPadding.p28.w,
                      end: AppPadding.p28.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(
                            AppStrings.forgetPassword,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.forgotPasswordRoute,
                            );
                          },
                        ),
                        TextButton(
                          child: Text(
                            AppStrings.registerText,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.registerRoute);
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }
}
