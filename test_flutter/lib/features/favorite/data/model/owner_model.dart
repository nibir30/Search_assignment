import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/owner_entity.dart';

part 'owner_model.g.dart';

@JsonSerializable()
class OwnerModel {
  String? name;
  String? profile_image;

  OwnerModel(
    this.name,
    this.profile_image,
  );

  factory OwnerModel.fromJson(Map<String, dynamic> json) => _$OwnerModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);

  OwnerEntity toEntity() {
    return OwnerEntity(
      name,
      profile_image,
    );
  }
}
