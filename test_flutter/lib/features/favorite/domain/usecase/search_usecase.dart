import 'package:test_flutter/features/favorite/domain/entity/get_profile_data_entity.dart';

import '../../../../api_gateway/repositories/login_repository/search_repository.dart';

class SearchUseCase {
  final SearchRepository searchRepository;
  SearchUseCase({required this.searchRepository});

  Future<ProfileResponseEntity?> getSearchData() async {
    return await searchRepository.getSearchData();
  }
}
