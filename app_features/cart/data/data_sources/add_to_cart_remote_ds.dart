import 'package:dio/dio.dart';
import 'package:daleel/core/utils/app_strings.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/network/api_constance.dart';
import 'package:flutter/foundation.dart';

abstract class AddToCartBaseRemoteDataSource {
  Future<AddToCartModel> AddToCart({
    required AddToCartParameters parameters,
  });
}


class AddToCartRemoteDataSource
    extends AddToCartBaseRemoteDataSource {

  final Dio dio;

  AddToCartBaseRemoteDataSource(this.dio);

  @override
  Future<AddToCartModel> AddToCart({
    required AddToCartParameters parameters,
  }) async {
    try{
  
      debugPrint(
          'URL => ${dio.options.baseUrl + ApiConstance.add_to_cart}');
      debugPrint('Headers => ${dio.options.headers.toString()}');

       final response = await dio.get(
      ApiConstance.AddToCartEndpoint,
      
      data: {
        'productId': parameters.productId,
        'quantity': parameters.quantity   
           },
    );
     return AddToCartModel.fromJson(response.data);  }on DioError catch (error) {
      if (error.response != null) {
        // ShowToust(Text: error.response!.data["message"]);
        throw error.response!.data;
      } else {
        throw Exception("Network error occurred");
      }
    }
   

 
  }
}

