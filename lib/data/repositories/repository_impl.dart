import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mvvm/data/Mapper/mapper.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/error_handling.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/failure.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/network_info.dart';
import 'package:flutter_clean_mvvm/data/Netowrk/requestes.dart';
import 'package:flutter_clean_mvvm/data/remote/data_sources/remote_data_source.dart';
import 'package:flutter_clean_mvvm/domain/Models/models.dart';
import 'package:flutter_clean_mvvm/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, Auth>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      ///network connect

      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          /// success
          /// return either right
          /// return data

          return Right(response.toDomain());
        } else {
          /// failure -- return business error
          /// return either left
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandling.handle(error).failure);
      }
    } else {
      ///no network connect
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
