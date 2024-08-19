import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failures, Type>> call([Param param]);
}

class NoParam {}
