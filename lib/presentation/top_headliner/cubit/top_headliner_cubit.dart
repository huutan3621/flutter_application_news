import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_test/data/repositories/news/news_impl.dart';
import 'package:flutter_application_test/domain/entities/news_entity.dart';
import 'package:flutter_application_test/domain/usecase/news_usecase.dart';

part 'top_headliner_state.dart';

class TopHeadLineCubit extends Cubit<TopHeadLineState> {
  TopHeadLineCubit() : super(TopHeadlinerInitial());

  final topHeadlineUsecase = NewsUseCase(NewsRepoImpl());

  Future init() async {
    final dataList = await topHeadlineUsecase.getTopHeadline();
    emit(state.copyWith(articleList: dataList, isLoaded: true));
  }
}
