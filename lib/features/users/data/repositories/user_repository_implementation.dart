import 'package:clean_architecture_practice/core/connection/network_info.dart';
import 'package:clean_architecture_practice/core/errors/expentions.dart';
import 'package:clean_architecture_practice/core/errors/failure.dart';
import 'package:clean_architecture_practice/core/params/params.dart';
import 'package:clean_architecture_practice/features/users/data/data_sources/user_local_data_source.dart';
import 'package:clean_architecture_practice/features/users/data/data_sources/user_remote_data_source.dart';
import 'package:clean_architecture_practice/features/users/domain/entities/user_entity.dart';
import 'package:clean_architecture_practice/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl(
      {required this.networkInfo,
      required this.userRemoteDataSource,
      required this.userLocalDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUser(
      {required UserParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await userRemoteDataSource.getUser(params);
        userLocalDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(
          Failure(errMessage: e.errorModel.errorMessage),
        );
      }
    } else {
      try {
        final localUser = await userLocalDataSource.getLastUser();
        return Right(localUser);
      } on ServerException catch (e) {
        return Left(
          Failure(errMessage: e.errorModel.errorMessage),
        );
      }
    }
  }
}
