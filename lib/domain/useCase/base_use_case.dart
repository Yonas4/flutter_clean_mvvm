import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
