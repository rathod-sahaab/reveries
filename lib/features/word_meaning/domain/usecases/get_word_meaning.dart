import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/faliure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/word_meaning.dart';
import '../repositories/word_meaning_repository.dart';

class GetWordMeaning implements Usecase<WordMeaning, Params> {
  final WordMeaningRepository repository;

  GetWordMeaning(this.repository);

  Future<Either<Faliure, WordMeaning>> call(Params params) async {
    return await repository.getWordMeaning(params.word);
  }
}

class Params extends Equatable {
  final String word;
  Params({@required this.word});
  @override
  List<Object> get props => [word];
}
