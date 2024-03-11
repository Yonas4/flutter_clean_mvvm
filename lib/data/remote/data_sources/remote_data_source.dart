import 'package:flutter_clean_mvvm/data/Netowrk/app_api.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/requestes.dart';
import 'package:flutter_clean_mvvm/data/response/repositories.dart';

abstract class RemoteDataSource {
  Future<AuthRespons> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this._appServesClint);

  final AppServesClint _appServesClint;

  @override
  Future<AuthRespons> login(LoginRequest loginRequest) async {
    // Unnecessary
    return await _appServesClint.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}
