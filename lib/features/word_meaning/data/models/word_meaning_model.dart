import 'dart:convert';

import 'package:flutter/material.dart';
import '../../domain/entities/word_meaning.dart';

class WordMeaningModel extends WordMeaning {
  WordMeaningModel({
    @required String word,
    @required List<Context> contexts,
  }) : super(word: word, contexts: contexts);

  factory WordMeaningModel.fromJson(String jsonString) {
    Map<String, dynamic> jsonObject = json.decode(jsonString);
    return WordMeaningModel(
      word: jsonObject['name'],
      contexts: jsonObject['contexts'],
    );
  }

  factory WordMeaningModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WordMeaningModel(word: map['word'], contexts: List<Context>.from(map['contexts']?.map((x)=>Context.fromMap(x)))
  }

  factory WordMeaningModel.fromListJson(String jsonString) {
    /***********************************************************************************
      Dictionary API format of data is
      [
        {
          word: ...,
          phonetics: [...],
          meanings: [...],
        }
        {
          word: ...,
          phonetics: [...],
          meanings: [...],
        }
      ]
      as the word is same per our requirement we it transfrom to

      {
        word: ...
        contexts: [
          {
            phonetics: [...],
            meanings: [...],
          }
          {
            phonetics: [...],
            meanings: [...],
          }
        ]
      }
    ****************************************************************************************/
    List<dynamic> jsonObject = json.decode(jsonString);
    String word = jsonObject[0]['word'];
    List<Context> contexts = [];

    jsonObject.forEach((wordMeanings) => {
          contexts.add(Context(
            phonetics: wordMeanings['phonetics'],
            meanings: wordMeanings['meanings'],
          ))
        });

    return WordMeaningModel(word: word, contexts: contexts);
  }
}
