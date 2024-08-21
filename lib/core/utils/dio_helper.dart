import 'package:dio/dio.dart';
import 'package:food_app/core/utils/end_point.dart';

class DioHelper {
  final Dio dio;

  DioHelper(this.dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Response> post(
      {required data,
      required String url,
      String? contentType,
      Map<String, String>? headers,
      String? token}) async {
    var response = dio.post(
      url,
      data: data,
      options: Options(
        contentType: contentType,
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );

    return response;
  }
}
