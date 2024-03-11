import 'package:dio/dio.dart';
import 'package:flutter_clean_mvvm/App/constants.dart';
import 'package:flutter_clean_mvvm/data/response/repositories.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServesClint {
  factory AppServesClint(Dio dio, {String baseUrl}) = _AppServesClint;

  @POST('/customer/login')
  Future<AuthRespons> login(
    @Field('email') String email,
    @Field('password') String password,
  );
}
