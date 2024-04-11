import 'package:flutter/material.dart';
import 'package:flutter_application_test/app/app_utils.dart';
import 'package:flutter_application_test/presentation/search/search_screen.dart';
import 'package:flutter_application_test/presentation/top_headliner/cubit/top_headliner_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopHeadLineChild extends StatefulWidget {
  const TopHeadLineChild({super.key});

  @override
  State<TopHeadLineChild> createState() => _TopHeadLineChildState();
}

class _TopHeadLineChildState extends State<TopHeadLineChild> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<TopHeadLineCubit>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TopHeadLineCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Headline'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: cubit.state.isLoaded
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cubit.state.articleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent), color: Colors.blueGrey),
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
                                : const SizedBox.shrink()
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
