import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {

  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {

    dio.options.headers['content-type'] = 'application/json';

    return await dio.get(
      url,
      options: Options(
        responseType: .json,
        method: 'GET',
      ),
    ).then((response){
      log('Get Method : ${response.toString()}');
      return response;
    }).catchError((e){
      if (e is DioException) {
        
        return e.response!;

      } else {
        return e;
      }
      
    });

  }


  Future<Response?> postMethod(String url, Map<String, dynamic> map) async {
    try {
      final response = await dio.post(
        url,
        data: dio_service.FormData.fromMap(map),
        options: Options(
          responseType: ResponseType.json,
          method: 'POST',
        ),
      );

      log('post method: ${response.toString()}');
      return response;
    } on DioException catch (e) {
      log('🔥 DioException.type: ${e.type}');
      log('🔥 DioException.message: ${e.message}');
      log('🔥 DioException.error: ${e.error}');
      log('🔥 DioException.response: ${e.response}');
    }
  }

}