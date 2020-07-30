import 'package:dio/dio.dart';
import 'package:school_app/api/intercept/ApiInterceptor.dart';
import 'package:school_app/common/Constant.dart';

class RestService {
  final dio = createDio();

  static Dio createDio() {
    Dio dio = Dio(BaseOptions(
        baseUrl: Constant.BASE_URL,
        connectTimeout: 50000,
        receiveTimeout: 30000
    ));

    setInterceptors(dio);
    return dio;
  }

  static void setInterceptors(Dio dio){
    dio.interceptors.clear();
    dio.interceptors.add(ApiInterceptor());
  }
}