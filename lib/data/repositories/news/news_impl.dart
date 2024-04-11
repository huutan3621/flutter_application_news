import 'package:flutter_application_test/app/app_country.dart';
import 'package:flutter_application_test/app/app_environment.dart';
import 'package:flutter_application_test/app/app_key.dart';
import 'package:flutter_application_test/data/data_source/remote/dio_service.dart';
import 'package:flutter_application_test/domain/entities/news_entity.dart';
import 'package:flutter_application_test/domain/repositories/news_repo.dart';

class NewsRepoImpl with NewsRepo {
  @override
  Future<List<ArticleModel>?> getTopHeadline() async {
    DioService dioService = DioService();
    const String path = '${AppEnviroment.environment}top-headlines?country=${AppCountry.us}&apiKey=${AppKey.appKey}';
    List<ArticleModel>? dataList = [];
    Map<String, dynamic> data = await dioService.fetchData(path);
    if (data.isNotEmpty) {
      final baseResponse = Data.fromJson(data);
      if (baseResponse.status == "ok") {
        if (baseResponse.articles is List) {
          List<dynamic>? articles = baseResponse.articles;
          if (articles != null) {
            for (var e in articles) {
              if (e is ArticleModel) {
                dataList.add(e);
              }
            }
          }
        }
      }
    } else {
      print("Failed to fetch data or empty data returned.");
    }
    return dataList;
  }

  @override
  Future<List<ArticleModel>?> searchTopHeadline(String keyword) async {
    DioService dioService = DioService();
    String path = '${AppEnviroment.environment}everything?q=$keyword&apiKey=${AppKey.appKey}';
    List<ArticleModel>? dataList = [];
    Map<String, dynamic> data = await dioService.fetchData(path);
    if (data.isNotEmpty) {
      final baseResponse = Data.fromJson(data);
      if (baseResponse.status == "ok") {
        if (baseResponse.articles is List) {
          List<dynamic>? articles = baseResponse.articles;
          if (articles != null) {
            for (var e in articles) {
              if (e is ArticleModel) {
                dataList.add(e);
              }
            }
          }
        }
      }
    } else {
      print("Failed to fetch data or empty data returned.");
    }
    return dataList;
  }
}
