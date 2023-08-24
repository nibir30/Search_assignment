// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) {
  return UserDataModel(
    json['title'] as String?,
    json['description'] as String?,
    json['share'] == null
        ? null
        : SharedModel.fromJson(json['share'] as Map<String, dynamic>),
    json['owner'] == null
        ? null
        : OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'share': instance.share,
      'owner': instance.owner,
    };
