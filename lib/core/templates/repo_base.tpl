import 'package:dartz/dartz.dart';
import '../entities/{{entity}}.dart';
import 'package:dartz/dartz.dart';

abstract class {{Feature}}BaseRepository {
  Future<Either<dynamic, {{entity}}>> call({
    required {{Feature}}Parameters parameters,
  });
}

