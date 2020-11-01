import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class WordMeaning extends Equatable {
  final String word;
  final List<Context> contexts; // same word has different contexts

  WordMeaning({
    @required this.word,
    @required this.contexts,
  }) : super([word, contexts]);
}

class Context extends Equatable {
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;

  Context({
    @required this.phonetics,
    @required this.meanings,
  }) : super([phonetics, meanings]);
}

class Phonetic extends Equatable {
  final String text, audio;

  Phonetic({
    @required this.text,
    @required this.audio,
  }) : super([text, audio]);
}

class Meaning extends Equatable {
  final String partOfSpeech;
  final List<Definition> definitions;

  Meaning({
    @required this.partOfSpeech,
    @required this.definitions,
  }) : super([partOfSpeech, definitions]);
}

class Definition extends Equatable {
  final String definition, example;
  final List<String> synonyms;

  Definition({
    @required this.definition,
    this.example,
    this.synonyms,
  }) : super([definition, example, synonyms]);
}
