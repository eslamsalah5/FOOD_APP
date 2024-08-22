import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_categories_cubit/fetch_categories_cubit.dart';
import 'package:food_app/features/home/presentation/views/widgets/appetizer_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/banner_container_list_view.dart';
import 'package:food_app/features/home/presentation/views/widgets/break_fast_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/category_tabs.dart';
import 'package:food_app/features/home/presentation/views/widgets/most_popular_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/search_container.dart';
import 'package:food_app/features/login/presentation/views/login_view.dart';
import 'package:food_app/features/views/get_start_view/get_start_view.dart';
import 'package:food_app/wrapper.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  final List<String> categories = const [
    'All Dishes',
    'Most Popular',
    'Breakfast',
    'Appetizers & Snacks',
    'Beef',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose the best dish for you',
                    style: TextStyle(
                      color: Color(0xFF32324D),
                      fontSize: 22,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 20.0),
                    child: SearchContainer(),
                  ),
                  BannerContainerListView(),
                  const SizedBox(height: 20),
                  // myButton(
                  //     onTap: () {
                  //       FirebaseAuth.instance.signOut().then((value) => {
                  //             CacheHelper.removeData(key: 'uId')
                  //                 .then((value) => {
                  //                       navToAndClear(
                  //                         context,
                  //                         const GetStartView(),
                  //                       )
                  //                     })
                  //           });
                  //     },
                  //     text: 'LogOut'),
                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: categories
          //           .map(
          //             (e) => Container(
          //               height: 50,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //                 // Creates border
          //                 color: Color(0xffFFB01D),
          //               ),
          //               margin: EdgeInsetsDirectional.only(
          //                 start: 20,
          //               ),
          //               padding: EdgeInsetsDirectional.only(
          //                 start: 12,
          //                 end: 12,
          //               ),
          //               child: Center(
          //                 child: Text(
          //                   categories[categories.indexOf(e)],
          //                   style: TextStyle(
          //                       fontSize: 16,
          //                       fontFamily: 'Mulish',
          //                       fontWeight: FontWeight.w700,
          //                       color: Colors.white),
          //                 ),
          //               ),
          //             ),
          //           )
          //           .toList(),
          //     ),
          //   ),
          // ),
          SliverFillRemaining(
            child: const CategoryTabs(),
          ),
        ],
      ),
    );
  }
}
