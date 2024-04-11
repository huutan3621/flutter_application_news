import 'package:flutter_application_test/domain/entities/news_entity.dart';
import 'package:flutter_application_test/domain/repositories/news_repo.dart';

class NewsUseCase {
  final NewsRepo _repository;

  NewsUseCase(this._repository);

  Future<List<ArticleModel>?> getTopHeadline() async {
    return await _repository.getTopHeadline();
  }

  Future<List<ArticleModel>?> searchTopHeadline(String keyword) async {
    return await _repository.searchTopHeadline(keyword);
  }
}
