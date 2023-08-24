import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:test_flutter/features/favorite/domain/entity/get_profile_data_entity.dart';
import 'package:test_flutter/features/favorite/domain/entity/user_data_entity.dart';

class FavoriteProvider with ChangeNotifier {
  ProfileResponseEntity favoriteResponses = ProfileResponseEntity(lists: []);

  void addFavorite(UserDataEntity data) {
    favoriteResponses.lists!.add(data);
    notifyListeners();
  }

  void deleteFavorite(UserDataEntity data) {
    favoriteResponses.lists!.removeWhere((element) => element.id == data.id);
    notifyListeners();
  }

  void clearFavorites() {
    favoriteResponses.lists!.clear();
    notifyListeners();
  }
}
