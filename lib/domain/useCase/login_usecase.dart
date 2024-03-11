import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/failure.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/requestes.dart';
import 'package:flutter_clean_mvvm/domain/Models/models.dart';
import 'package:flutter_clean_mvvm/domain/repositories/repository.dart';
import 'package:flutter_clean_mvvm/domain/useCase/base_use_case.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Auth> {
  LoginUseCase(this._repository);

  final Repository _repository;

  @override
  Future<Either<Failure, Auth>> execute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  LoginUseCaseInput(this.email, this.password);

  String email;
  String password;
}
