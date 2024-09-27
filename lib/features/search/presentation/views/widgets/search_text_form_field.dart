import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: searchController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.black),
        // onChanged: (value) {
        //   BlocProvider.of<SearchCubit>(context)
        //       .fetchSearchedFood(searchWord: value);
        // },
        onFieldSubmitted: (value) {
          BlocProvider.of<SearchCubit>(context)
              .fetchSearchedFood(searchWord: value);
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
          ),
          hintText: 'Search',
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ));
  }
}
