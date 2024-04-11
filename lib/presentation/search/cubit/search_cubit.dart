import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/data/repositories/news/news_impl.dart';
import 'package:flutter_application_test/domain/entities/news_entity.dart';
import 'package:flutter_application_test/domain/usecase/news_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final TextEditingController txtController = TextEditingController();

  final topHeadlineUsecase = NewsUseCase(NewsRepoImpl());
  Future init() async {}

  Future updateKeyword(String keyword) async {
    txtController.text = keyword;
    emit(state.copyWith(keyword: keyword, isLoaded: false));
    await search();
  }

  Future search() async {
    final dataList = await topHeadlineUsecase.searchTopHeadline(state.keyword);
    emit(state.copyWith(articleList: dataList, isLoaded: true));
  }
}
