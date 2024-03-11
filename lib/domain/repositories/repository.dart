import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/requestes.dart';
import 'package:flutter_clean_mvvm/domain/Models/models.dart';

import 'package:flutter_clean_mvvm/data/Netowrk/failure.dart';

abstract class Repository {
  Future<Either<Failure, Auth>> login(LoginRequest loginRequest);
}
