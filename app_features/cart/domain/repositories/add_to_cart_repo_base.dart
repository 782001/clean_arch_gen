import 'package:dartz/dartz.dart';
import '../entities/AddToCartResponseEntity.dart';
import 'package:dartz/dartz.dart';

abstract class AddToCartBaseRepository {
  Future<Either<dynamic, AddToCartResponseEntity>> call({
    required AddToCartParameters parameters,
  });
}

