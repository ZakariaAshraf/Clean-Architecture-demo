import 'package:clean_architecture_practice/features/users/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';

abstract class UserRepository{
  Future<Either<Failure,UserEntity>>getUser({required UserParams params});
}