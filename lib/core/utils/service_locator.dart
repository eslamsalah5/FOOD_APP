import 'package:dio/dio.dart';
import 'package:food_app/core/utils/dio_helper.dart';
import 'package:food_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:food_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:food_app/features/home/data/repos/home_repo_impl.dart';
import 'package:food_app/features/order/data/data_source/order_remote_data_source.dart';
import 'package:food_app/features/order/data/repos/order_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioHelper>(
    DioHelper(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
    ),
  );

  getIt.registerSingleton<OrderRepoImpl>(
    OrderRepoImpl(
      orderRemoteDataSource: OrderRemoteDataSourceImpl(),
    ),
  );
}
