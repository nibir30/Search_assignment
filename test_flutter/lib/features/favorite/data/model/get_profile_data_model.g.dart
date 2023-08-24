// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(Map<String, dynamic> json) {
  return ProfileResponseModel(
    (json['lists'] as List<dynamic>?)
        ?.map((e) => UserDataModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'lists': instance.lists,
    };
