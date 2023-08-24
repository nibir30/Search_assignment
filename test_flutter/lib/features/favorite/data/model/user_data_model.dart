import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter/features/favorite/data/model/share_model.dart';

import '../../domain/entity/user_data_entity.dart';
import 'owner_model.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  String? id;
  String? title;
  String? description;
  SharedModel? share;
  OwnerModel? owner;

  UserDataModel(
    this.id,
    this.title,
    this.description,
    this.share,
    this.owner,
  );

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);

  UserDataEntity toEntity() {
    return UserDataEntity(
      id,
      title,
      description,
      share!.toEntity(),
      owner!.toEntity(),
    );
  }
}
