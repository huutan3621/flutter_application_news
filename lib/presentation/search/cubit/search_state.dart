part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<ArticleModel> articleList;
  final bool isLoaded;
  final String keyword;
  const SearchState({
    this.articleList = const [],
    this.isLoaded = false,
    this.keyword = "",
  });

  @override
  List<Object> get props => [articleList, isLoaded, keyword];

  SearchState copyWith({
    List<ArticleModel>? articleList,
    bool? isLoaded,
    String? keyword,
  }) {
    return SearchState(
      articleList: articleList ?? this.articleList,
      isLoaded: isLoaded ?? this.isLoaded,
      keyword: keyword ?? this.keyword,
    );
  }
}

final class SearchInitial extends SearchState {}
