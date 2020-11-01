import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../errors/faliure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Faliure, Type>> call(Params params);
}

class NoParams extends Equatable {}
