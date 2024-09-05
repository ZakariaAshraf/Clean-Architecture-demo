import 'package:clean_architecture_practice/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/user_entity.dart';

class GetUser{
  final UserRepository repository;

  GetUser({required this.repository});

  Future<Either<Failure, UserEntity>>call(UserParams params){
    return repository.getUser(params: params);
  }

}