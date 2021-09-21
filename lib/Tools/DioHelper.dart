import 'package:dio/dio.dart';

class DioHelper {
  static String host = "http://175.27.189.9/";
  CheckContact() {}
  late Dio dio;
  // DioHelper() {
  //   dio = Dio(
  //       BaseOptions(baseUrl: host, connectTimeout: 500000, receiveTimeout: 3000000));
  // }
}
