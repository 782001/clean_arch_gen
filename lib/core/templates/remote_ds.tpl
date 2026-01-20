import 'package:dio/dio.dart';
import 'package:daleel/core/utils/app_strings.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/network/api_constance.dart';
import 'package:flutter/foundation.dart';

abstract class {{Feature}}BaseRemoteDataSource {
  Future<{{Feature}}Model> {{Feature}}({
    required {{Feature}}Parameters parameters,
  });
}


class {{Feature}}RemoteDataSource
    extends {{Feature}}BaseRemoteDataSource {

  final Dio dio;

  {{Feature}}BaseRemoteDataSource(this.dio);

  @override
  Future<{{Feature}}Model> {{Feature}}({
    required {{Feature}}Parameters parameters,
  }) async {
    try{
   
      debugPrint(
          'URL => ${dio.options.baseUrl + ApiConstance.{{endpoint}}}');
      debugPrint('Headers => ${dio.options.headers.toString()}');

       final response = await dio.{{method}}(
      ApiConstance.{{endpoint}},
       queryParameters: {
       {{queryParameters}}
        },
      data: {
        {{dataBodyMap}}   
           },
    );
     return {{Feature}}Model.fromJson(response.data);  }on DioError catch (error) {
      if (error.response != null) {
        // ShowToust(Text: error.response!.data["message"]);
        throw error.response!.data;
      } else {
        throw Exception("Network error occurred");
      }
    }
   

 
  }
}

