import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_test/app/app_utils.dart';
import 'package:flutter_application_test/presentation/search/cubit/search_cubit.dart';
import 'package:flutter_application_test/presentation/widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchChild extends StatefulWidget {
  const SearchChild({super.key});

  @override
  State<SearchChild> createState() => _SearchChildState();
}

class _SearchChildState extends State<SearchChild> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<SearchCubit>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchCubit>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        ),
        body: Column(
          children: [
            TextField(
              controller: cubit.txtController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                labelText: 'Search',
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                keywordWidget(cubit, "Vietravel"),
                keywordWidget(cubit, "Apple"),
                keywordWidget(cubit, "Bitcoin"),
              ],
            ),
            PressButton(
              onPressed: () {
                cubit.updateKeyword(cubit.txtController.text);
              },
              buttonText: "Search",
            ),
            cubit.state.isLoaded
                ? Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: cubit.state.articleList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          decoration:
                              BoxDecoration(border: Border.all(color: Colors.blueAccent), color: Colors.blueGrey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(cubit.state.articleList[index].content ?? ""),
                              Text(cubit.state.articleList[index].description ?? ""),
                              Text(AppUtils.formatDate(cubit.state.articleList[index].publishedAt)),
                              cubit.state.articleList[index].urlToImage != null
                                  ? Image.network(
                                      '${cubit.state.articleList[index].urlToImage}',
                                    )
                                  : const SizedBox.shrink(),
                              Text(cubit.state.articleList[index].source?.name ?? ""),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }

  Widget keywordWidget(SearchCubit cubit, String keyword) => Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(onTap: () => cubit.updateKeyword(keyword), child: Text(keyword)));
}
