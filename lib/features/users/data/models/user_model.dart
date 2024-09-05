import 'package:clean_architecture_practice/features/users/data/models/sub_models/address_model.dart';
import 'package:clean_architecture_practice/features/users/data/models/sub_models/company_model.dart';
import 'package:clean_architecture_practice/features/users/domain/entities/user_entity.dart';

import '../../../../core/databases/api/end_points.dart';

class UserModel extends UserEntity {
  final int id;
  final String website;
  final String username;
  final CompanyModel company;

  UserModel({
    required this.id,
    required this.username,
    required this.website,
    required this.company,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
  });
  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      address: AddressModel.fromJson(json[ApiKey.address]),
      company: CompanyModel.fromJson(json[ApiKey.company]),
    );
  }

  Map<String, dynamic>toJson(){
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.email: email,
      ApiKey.phone: phone,
      ApiKey.username: username,
      ApiKey.website: website,
      ApiKey.company: company,
      ApiKey.address: address,
    };
  }
}
