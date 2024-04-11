import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/search/components/search_child.dart';
import 'package:flutter_application_test/presentation/search/cubit/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const SearchChild(),
    );
  }
}
