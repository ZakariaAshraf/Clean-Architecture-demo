import 'package:clean_architecture_practice/core/connection/network_info.dart';
import 'package:clean_architecture_practice/core/databases/api/dio_consumer.dart';
import 'package:clean_architecture_practice/core/databases/cache/cache_helper.dart';
import 'package:clean_architecture_practice/core/params/params.dart';
import 'package:clean_architecture_practice/features/users/data/data_sources/user_local_data_source.dart';
import 'package:clean_architecture_practice/features/users/data/data_sources/user_remote_data_source.dart';
import 'package:clean_architecture_practice/features/users/data/repositories/user_repository_implementation.dart';
import 'package:clean_architecture_practice/features/users/domain/use_cases/get_user.dart';
import 'package:clean_architecture_practice/features/users/presentation/manager/user_states.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  failureOrUser(int id) async {
    emit(GetUserLoading());
    final failureOrUser = await GetUser(
      repository: UserRepositoryImpl(
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        userRemoteDataSource: UserRemoteDataSource(
          api: DioConsumer(
            dio: Dio(),
          ),
        ),
        userLocalDataSource: UserLocalDataSource(cache: CacheHelper()),
      ),
    ).call(
      UserParams(
        id: id.toString(),
      ),
    );
    failureOrUser.fold(
      (failure) => emit(
        GetUserFailure(errMessage: failure.errMessage),
      ),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
