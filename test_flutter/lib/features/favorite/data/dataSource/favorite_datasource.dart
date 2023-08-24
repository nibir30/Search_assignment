import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter/features/favorite/data/model/get_profile_data_model.dart';

import '../../../../api_gateway/favorite_api.dart';

abstract class SearchDataSource {
  Future<ProfileResponseModel?> getSearchData();
}

class SearchDataSourceImpl implements SearchDataSource {
  final SearchApi _getSearchDataApi = SearchApi();

  SearchDataSourceImpl();

  @override
  Future<ProfileResponseModel?> getSearchData() async {
    /// url input
    String url = 'https://list.ly/api/v4/lists/trending?page=1&per_page=10';

    /// http request
    final response = await http.get(Uri.parse(url));

    /// json data to List of Maps conversion
    final Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));

    /// map to model conversion
    ProfileResponseModel _response = _getSearchDataApi.listMapResponse(body);
    return _response;
  }
}
