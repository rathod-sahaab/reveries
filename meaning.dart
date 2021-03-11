import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'definition.dart';

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;
  Meaning({
    this.partOfSpeech,
    this.definitions,
  });

  Meaning copyWith({
    String partOfSpeech,
    List<Definition> definitions,
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
      definitions: List<Definition>.from(map['definitions']?.map((x) => Definition.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Meaning.fromJson(String source) => Meaning.fromMap(json.decode(source));

  @override
  String toString() => 'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions)';

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