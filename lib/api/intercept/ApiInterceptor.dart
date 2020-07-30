import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) async {
    if (options != null) {
      print(options.uri.toString());
      return options;
    }
  }

  @override
  Future onError(DioError err) async {
    if (err != null) {
      print(err.message);
      return err;
    }
  }

  @override
  Future onResponse(Response response) async {
    if (response != null){
      print("DATA : ${response.data} ");
      return response;
    }
  }
}