import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/home/presentation/views/widgets/appetizer_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/banner_container_list_view.dart';
import 'package:food_app/features/home/presentation/views/widgets/beef_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/break_fast_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/category_list.dart';
import 'package:food_app/features/home/presentation/views/widgets/most_popular_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/search_container.dart';
import 'package:food_app/features/views/get_start_view/get_start_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
          SliverToBoxAdapter(
            child: CategoryList(),
          ),
          // SliverFillRemaining(
          //   child: const CategoryTabs(),
          // ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          // SliverFillRemaining(
          //   child: AllDishes(),
          // )
          SliverToBoxAdapter(
            child: MostPopularSection(),
          ),
          SliverToBoxAdapter(
            child: BreakFastSection(),
          ),
          SliverToBoxAdapter(
            child: AppetizerSection(),
          ),
          SliverToBoxAdapter(
            child: BeefSection(),
          ),
        ],
      ),
    );
  }
}
