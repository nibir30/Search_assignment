import 'package:test_flutter/features/favorite/data/model/get_profile_data_model.dart';

class SearchApi {
  ProfileResponseModel listMapResponse(Map<String, dynamic>? responseJson) {
    final ProfileResponseModel _singleResult = ProfileResponseModel.fromJson(responseJson!);

    return _singleResult;
  }
}
