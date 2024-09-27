import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/core/utils/service_locator.dart';
import 'package:food_app/features/search/data/repos/search_repo_impl.dart';
import 'package:food_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:food_app/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
      body: SearchViewBody(),
    );
  }
}
