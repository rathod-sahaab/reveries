import 'dart:convert';

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

  factory Phonetic.fromJson(String source) => Phonetic.fromMap(json.decode(source));

  @override
  String toString() => 'Phonetic(text: $text, audio: $audio)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Phonetic &&
      o.text == text &&
      o.audio == audio;
  }

  @override
  int get hashCode => text.hashCode ^ audio.hashCode;
}