import '../../domain/entities/AddToCartResponseEntity.dart';

class AddToCartModel extends AddToCartResponseEntity {
  AddToCartModel({super.message});

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      message: json['message'],
    );
  }
}
