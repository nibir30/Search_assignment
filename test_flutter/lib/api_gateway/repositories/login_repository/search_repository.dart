import 'package:test_flutter/features/favorite/data/model/get_profile_data_model.dart';
import 'package:test_flutter/features/favorite/domain/entity/get_profile_data_entity.dart';

import '../../../features/favorite/data/dataSource/favorite_datasource.dart';

abstract class SearchRepository {
  Future<ProfileResponseEntity?> getSearchData();
}

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _searchDataSource = SearchDataSourceImpl();

  SearchRepositoryImpl();

  @override
  Future<ProfileResponseEntity?> getSearchData() async {
    final ProfileResponseModel? _response = await _searchDataSource.getSearchData();

    /// converting models to entities
    ProfileResponseEntity? _searchEntity = _response!.toEntity();
    return _searchEntity;
  }
}
