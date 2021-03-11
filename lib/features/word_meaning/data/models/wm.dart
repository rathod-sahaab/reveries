import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reveries/features/word_meaning/domain/entities/word_meaning.dart';

class WordMeaningModel extends WordMeaning {
  WordMeaningModel({
    @required String word,
    @required List<Context> contexts,
  }) : super(word: word, contexts: contexts);

  // WordMeaning copyWith({
  //   String word,
  //   List<Context> contexts,
  // }) {
  //   return WordMeaning(
  //     word: word ?? this.word,
  //     contexts: contexts ?? this.contexts,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'contexts': contexts?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory WordMeaningModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WordMeaningModel(
      word: map['word'],
      contexts:
          List<Context>.from(map['contexts']?.map((x) => Context.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WordMeaningModel.fromJson(String source) =>
      WordMeaningModel.fromMap(json.decode(source));

  @override
  String toString() => 'WordMeaning(word: $word, contexts: $contexts)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WordMeaningModel &&
        o.word == word &&
        listEquals(o.contexts, contexts);
  }

  @override
  int get hashCode => word.hashCode ^ contexts.hashCode;
}

class Context {
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;
  Context({
    this.phonetics,
    this.meanings,
  });

  Context copyWith({
    List<Phonetic> phonetics,
    List<Meaning> meanings,
  }) {
    return Context(
      phonetics: phonetics ?? this.phonetics,
      meanings: meanings ?? this.meanings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phonetics': phonetics?.map((x) => x?.toMap())?.toList(),
      'meanings': meanings?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Context.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Context(
      phonetics: List<Phonetic>.from(
          map['phonetics']?.map((x) => Phonetic.fromMap(x))),
      meanings:
          List<Meaning>.from(map['meanings']?.map((x) => Meaning.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Context.fromJson(String source) =>
      Context.fromMap(json.decode(source));

  @override
  String toString() => 'Context(phonetics: $phonetics, meanings: $meanings)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Context &&
        listEquals(o.phonetics, phonetics) &&
        listEquals(o.meanings, meanings);
  }

  @override
  int get hashCode => phonetics.hashCode ^ meanings.hashCode;
}

class Phonetic {
  final String text;
  final String audio;
  Phonetic({
    this.text,
    this.audio,
  });

  Phonetic copyWith({
    String text,
    String audio,
  }) {
    return Phonetic(
      text: text ?? this.text,
      audio: audio ?? this.audio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'audio': audio,
    };
  }

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Phonetic(
      text: map['text'],
      audio: map['audio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Phonetic.fromJson(String source) =>
      Phonetic.fromMap(json.decode(source));

  @override
  String toString() => 'Phonetic(text: $text, audio: $audio)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Phonetic && o.text == text && o.audio == audio;
  }

  @override
  int get hashCode => text.hashCode ^ audio.hashCode;
}

class Meaning {
  final String partOfSpeech;
  final List<DefinitionModel> definitions;
  Meaning({
    this.partOfSpeech,
    this.definitions,
  });

  Meaning copyWith({
    String partOfSpeech,
    List<DefinitionModel> definitions,
  }) {
    return Meaning(
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      definitions: definitions ?? this.definitions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions': definitions?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Meaning.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Meaning(
      partOfSpeech: map['partOfSpeech'],
      definitions: List<DefinitionModel>.from(
          map['definitions']?.map((x) => DefinitionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Meaning.fromJson(String source) =>
      Meaning.fromMap(json.decode(source));

  @override
  String toString() =>
      'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Meaning &&
        o.partOfSpeech == partOfSpeech &&
        listEquals(o.definitions, definitions);
  }

  @override
  int get hashCode => partOfSpeech.hashCode ^ definitions.hashCode;
}

class DefinitionModel extends Definition {
  DefinitionModel({
    @required String definition,
    String example,
    List<String> synonyms,
  }) : super(
          definition: definition,
          example: example,
          synonyms: synonyms,
        );

  DefinitionModel copyWith({
    String definition,
    String example,
    List<String> synonyms,
  }) {
    return DefinitionModel(
      definition: definition ?? this.definition,
      example: example ?? this.example,
      synonyms: synonyms ?? this.synonyms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'definition': definition,
      'example': example,
      'synonyms': synonyms,
    };
  }

  factory DefinitionModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DefinitionModel(
      definition: map['definition'],
      example: map['example'],
      synonyms: List<String>.from(map['synonyms']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DefinitionModel.fromJson(String source) =>
      DefinitionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Definition(definition: $definition, example: $example, synonyms: $synonyms)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DefinitionModel &&
        o.definition == definition &&
        o.example == example &&
        listEquals(o.synonyms, synonyms);
  }

  @override
  int get hashCode =>
      definition.hashCode ^ example.hashCode ^ synonyms.hashCode;
}
