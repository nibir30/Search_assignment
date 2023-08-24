// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedModel _$SharedModelFromJson(Map<String, dynamic> json) {
  return SharedModel(
    json['shareSource'] as String?,
    json['shareDescription'] as String?,
  );
}

Map<String, dynamic> _$SharedModelToJson(SharedModel instance) =>
    <String, dynamic>{
      'shareSource': instance.shareSource,
      'shareDescription': instance.shareDescription,
    };
