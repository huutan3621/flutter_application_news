import 'package:flutter_application_test/domain/entities/news_entity.dart';

mixin NewsRepo {
  Future<List<ArticleModel>?> getTopHeadline();
  Future<List<ArticleModel>?> searchTopHeadline(String keyword);
}
