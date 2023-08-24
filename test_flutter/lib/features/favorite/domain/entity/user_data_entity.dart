import 'owner_entity.dart';
import 'share_entity.dart';

class UserDataEntity {
  String? title;
  String? description;
  SharedEntity? share;
  OwnerEntity? owner;
  bool? isfavorite = false;

  UserDataEntity(
    this.title,
    this.description,
    this.share,
    this.owner,
  );
}
