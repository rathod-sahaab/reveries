import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'meaning.dart';
import 'phonetic.dart';

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
      phonetics: List<Phonetic>.from(map['phonetics']?.map((x) => Phonetic.fromMap(x))),
      meanings: List<Meaning>.from(map['meanings']?.map((x) => Meaning.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Context.fromJson(String source) => Context.fromMap(json.decode(source));

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