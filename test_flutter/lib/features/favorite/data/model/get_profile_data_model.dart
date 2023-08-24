import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter/features/favorite/data/model/user_data_model.dart';
import 'package:test_flutter/features/favorite/domain/entity/user_data_entity.dart';

import '../../domain/entity/get_profile_data_entity.dart';

part 'get_profile_data_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  List<UserDataModel>? lists;

  ProfileResponseModel(
    this.lists,
  );

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => _$ProfileResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);

  ProfileResponseEntity toEntity() {
    List<UserDataEntity>? userRoleEntity = [];

    for (var i = 0; i < lists!.length; i++) {
      userRoleEntity.add(lists![i].toEntity());
    }
    return ProfileResponseEntity(
      lists: userRoleEntity,
    );
  }
}
