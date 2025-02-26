import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/sub_entities/address_entity.dart';
import 'geo_model.dart';

class AddressModel extends AddressEntity {
  AddressModel(
      {required super.street,
        required super.suite,
        required super.city,
        required super.zipcode,
        required super.geo});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        street: ApiKey.street,
        suite: ApiKey.suite,
        city: ApiKey.city,
        zipcode: ApiKey.zipcode,
        geo: GeoModel.fromJson(json[ApiKey.geo]));
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.street: street,
      ApiKey.suite: suite,
      ApiKey.city: city,
      ApiKey.zipcode: zipcode,
      ApiKey.geo: geo,
    };
  }
}