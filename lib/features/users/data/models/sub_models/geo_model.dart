import 'package:clean_architecture_practice/core/databases/api/end_points.dart';
import 'package:clean_architecture_practice/features/users/domain/entities/sub_entities/address_entity.dart';

import '../../../domain/entities/sub_entities/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({
    required super.lat,
    required super.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: json[ApiKey.lat],
      lng: json[ApiKey.lng],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.lat: lat,
      ApiKey.lng: lng,
    };
  }

}
