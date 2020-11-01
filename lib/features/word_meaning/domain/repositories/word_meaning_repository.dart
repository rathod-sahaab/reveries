import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliure.dart';
import '../entities/word_meaning.dart';

abstract class WordMeaningRepository {
  Future<Either<Faliure, WordMeaning>> getWordMeaning(String word);
}
