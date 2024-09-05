import 'package:clean_architecture_practice/core/databases/api/api_consumer.dart';
import 'package:clean_architecture_practice/core/databases/api/end_points.dart';
import 'package:clean_architecture_practice/core/params/params.dart';
import 'package:clean_architecture_practice/features/users/data/models/user_model.dart';

import '../../../../core/databases/api/dio_consumer.dart';

class UserRemoteDataSource{
 final ApiConsumer api;
UserRemoteDataSource({required this.api});


 Future<UserModel>getUser(UserParams params)async{
  final response =  await api.get("${EndPoints.user}/${params.id}");
  return UserModel.fromJson(response);
  }
}