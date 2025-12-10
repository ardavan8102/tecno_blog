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


  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {

    dio.options.headers['content-type'] = 'application/json';

    // TODO : Read Token from storage

    return await dio.post(
      url,
      data: dio_service.FormData.fromMap(map),
      options: Options(
        responseType: .json,
        method: 'POST',
      ),
    ).then((value){
      log('post method : ${value.toString()}');
      return value;
    }).catchError((e) {
      if (e is DioException) {
        return e.response!;
      } else {
        return e;
      }
    });

  }

}