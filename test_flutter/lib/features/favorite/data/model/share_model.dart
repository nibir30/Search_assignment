import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/share_entity.dart';

part 'share_model.g.dart';

@JsonSerializable()
class SharedModel {
  String? shareSource;
  String? shareDescription;

  SharedModel(
    this.shareSource,
    this.shareDescription,
  );

  factory SharedModel.fromJson(Map<String, dynamic> json) => _$SharedModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SharedModelToJson(this);

  SharedEntity toEntity() {
    return SharedEntity(
      shareSource,
      shareDescription,
    );
  }
}
