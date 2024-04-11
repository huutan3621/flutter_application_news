import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/top_headliner/components/top_headliner_child.dart';
import 'package:flutter_application_test/presentation/top_headliner/cubit/top_headliner_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopHeadLinerScreen extends StatelessWidget {
  const TopHeadLinerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopHeadLineCubit(),
      child: const TopHeadLineChild(),
    );
  }
}
