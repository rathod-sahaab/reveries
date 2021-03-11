import 'dart:convert';

import 'package:flutter/foundation.dart';

class Definition {
  final String definition;
  final String example;
  final List<String> synonyms;
  Definition({
    this.definition,
    this.example,
    this.synonyms,
  });

  Definition copyWith({
    String definition,
    String example,
    List<String> synonyms,
  }) {
    return Definition(
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

  factory Definition.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Definition(
      definition: map['definition'],
      example: map['example'],
      synonyms: List<String>.from(map['synonyms']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Definition.fromJson(String source) => Definition.fromMap(json.decode(source));

  @override
  String toString() => 'Definition(definition: $definition, example: $example, synonyms: $synonyms)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Definition &&
      o.definition == definition &&
      o.example == example &&
      listEquals(o.synonyms, synonyms);
  }

  @override
  int get hashCode => definition.hashCode ^ example.hashCode ^ synonyms.hashCode;
}