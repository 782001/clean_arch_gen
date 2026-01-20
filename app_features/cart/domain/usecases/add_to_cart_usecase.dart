import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/base_usecase/base_usecase.dart';
import '../entities/AddToCartResponseEntity.dart';
import '../repositories/add_to_cart_base_repository.dart';

class AddToCartUseCase
    extends BaseUseCase<AddToCartResponseEntity, AddToCartParameters> {
  final AddToCartBaseRepository baseRepository;

  AddToCartUseCase({required this.baseRepository});

  @override
  Future<Either<dynamic, AddToCartResponseEntity>> call(
      AddToCartParameters parameters) async {
    return await baseRepository.call(parameters: parameters);
  }
}

class AddToCartParameters extends Equatable {
  final String productId;
  final int quantity;
  final String productId;
  final int quantity;

  const AddToCartParameters({
    required this.productId,
    required this.quantity,
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity, productId, quantity];
}
