import 'package:dartz/dartz.dart';
import '../../domain/entities/AddToCartResponseEntity.dart';
import '../../domain/repositories/AddToCart_base_repository.dart';
import '../data_sources/AddToCart_remote_data_source.dart';

class AddToCartRepository extends AddToCartBaseRepository {
  final AddToCartBaseRemoteDataSource baseRemoteDataSource;

  AddToCartRepository(this.baseRemoteDataSource);

  @override
  Future<Either<dynamic, AddToCartResponseEntity>> call({
    required AddToCartParameters parameters,
  }) async {
    try {
      final response = await baseRemoteDataSource.AddToCart(
        parameters: parameters,
      );
      return Right(response);
    } catch (e) {
      return Left(e);
    }
  }
}

