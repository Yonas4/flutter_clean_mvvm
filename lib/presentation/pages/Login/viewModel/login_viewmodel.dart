import 'dart:async';

import 'package:flutter_clean_mvvm/domain/useCase/login_usecase.dart';
import 'package:flutter_clean_mvvm/presentation/Base/base_view_model.dart';

import 'package:flutter_clean_mvvm/presentation/common/freezed_data_class.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOut {
  LoginViewModel(this._loginUseCase);

  //stream controllers outputs
  final StreamController<String> _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController<String> _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController<void> _areAllInputValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject('', '');

  final LoginUseCase _loginUseCase;

  //inputs
  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
    _areAllInputValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputValidStreamController.sink;

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  @override
  login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(loginObject.userName, loginObject.password),
    ))
        .fold(
            (failure) => {
                  // left -> failure
                  print(failure.message)
                },
            (data) => {
                  // right success -> data
                  print(data.contacts?.email)
                });
  }

  // outputs
  @override
  Stream<bool> get outIsPasswordValid =>
      _passwordStreamController.stream.map(_isPasswordValid);

  @override
  Stream<bool> get outIsUserNameValid =>
      _userNameStreamController.stream.map(_isUserNameValid);

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputValidStreamController.stream.map((_) => _areAllInputValid());

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areAllInputValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }
}

abstract class LoginViewModelInput {
  void setUserName(String userName);

  void setPassword(String password);

  login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;
}

abstract class LoginViewModelOut {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;

  Stream<void> get outAreAllInputsValid;
}
