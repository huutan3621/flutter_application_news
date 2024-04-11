part of 'top_headliner_cubit.dart';

class TopHeadLineState extends Equatable {
  final List<ArticleModel> articleList;
  final bool isLoaded;
  const TopHeadLineState({
    this.articleList = const [],
    this.isLoaded = false,
  });

  @override
  List<Object> get props => [articleList, isLoaded];

  TopHeadLineState copyWith({
    List<ArticleModel>? articleList,
    bool? isLoaded,
  }) {
    return TopHeadLineState(articleList: articleList ?? this.articleList, isLoaded: isLoaded ?? this.isLoaded);
  }
}

final class TopHeadlinerInitial extends TopHeadLineState {}
