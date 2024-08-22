import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/core/utils/keys.dart';
import 'package:food_app/core/utils/service_locator.dart';
import 'package:food_app/core/widgets/bloc_observe.dart';
import 'package:food_app/features/home/data/repos/home_repo_impl.dart';
import 'package:food_app/features/home/domin/entities/category_entitie.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_appetizer_food_cubit/fetch_appetizer_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_beef_food_cubit/fetch_beef_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_break_fast_food/fetch_break_fast_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_categories_cubit/fetch_categories_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_popular_food_cubit/fetch_popular_food_cubit.dart';
import 'package:food_app/features/order/data/repos/order_repo_impl.dart';
import 'package:food_app/features/order/presentation/mangers/order_cubit/order_cubit.dart';
import 'package:food_app/features/views/onboarding_view/onboarding_view.dart';
import 'package:food_app/features/register/presentation/register_cubit/register_cubit.dart';
import 'package:food_app/features/views/splash_view/splash_view.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/features/views/get_start_view/get_start_view.dart';
import 'package:food_app/features/views/location_view/location_view.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Stripe.publishableKey = Keys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await CacheHelper.init();
  Hive.registerAdapter(CategoryEntitieAdapter());
  Hive.registerAdapter(FoodEntitieAdapter());
  // Hive.registerAdapter(OrderEntitieAdapter());
  await Hive.openBox<CategoryEntitie>(kCategoryTitle);
  await Hive.openBox<FoodEntitie>(kPopularTitle);
  await Hive.openBox<FoodEntitie>(kAppetizerTitle);
  await Hive.openBox<FoodEntitie>(kBreakFastTitle);
  await Hive.openBox<FoodEntitie>(kBeefTitle);
  setupServiceLocator();

  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RegisterCubit(),
          ),
          BlocProvider(
            create: (_) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => FetchCategoriesCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchCategories(),
          ),
          BlocProvider(
            create: (context) => FetchPopularFoodCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchPopularFood(),
          ),
          BlocProvider(
            create: (context) => FetchAppetizerFoodCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchAppetizerFood(),
          ),
          BlocProvider(
            create: (context) => FetchBreakFastFoodCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchBreakFastFood(),
          ),
          BlocProvider(
            create: (context) => FetchBeefFoodCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchBeefFood(),
          ),
          BlocProvider(
            create: (context) => OrderCubit(
              getIt.get<OrderRepoImpl>(),
            )..fetchOrders(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.mulishTextTheme(),
            scaffoldBackgroundColor: const Color(0xffF9F9F9),
          ),
          routes: {
            SplashView.pageID: (_) => const SplashView(),
            OnBoardingView.pageID: (_) => const OnBoardingView(),
            GetStartView.pageID: (_) => const GetStartView(),
            LocationView.pageID: (_) => const LocationView(),
          },
          initialRoute: SplashView.pageID,
        ),
      ),
    );
  }
}
