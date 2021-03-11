import 'package:flutter_test/flutter_test.dart';
import 'package:reveries/features/word_meaning/data/models/word_meaning_model.dart';
import 'package:reveries/features/word_meaning/domain/entities/word_meaning.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tWordMeaningModel = WordMeaningModel(
    word: "content",
    contexts: [
      Context(
        phonetics: [
          Phonetic(
              text: "/kənˈtɛnt/",
              audio:
                  "https://lex-audio.useremarkable.com/mp3/xcontent_us_1.mp3"),
        ],
        meanings: [
          Meaning(
            partOfSpeech: "adjective",
            definitions: [
              Definition(
                definition: "In a state of peaceful happiness.",
                example: "he seemed more content, less bitter",
                synonyms: ["contented", "satisfied", "pleased"],
              )
            ],
          ),
          Meaning(
            partOfSpeech: "transitive verb",
            definitions: [
              Definition(
                definition: "Satisfy (someone)",
                example: "nothing would content her",
                synonyms: [
                  "soothe",
                  "pacify",
                  "placate",
                  "appease",
                  "please",
                  "mollify",
                  "make happy",
                  "satisfy",
                  "still",
                  "silence"
                ],
              ),
            ],
          ),
          Meaning(
            partOfSpeech: "intransitive verb",
            definitions: [
              Definition(
                definition: "Say or shout “hello”; greet someone.",
                example: "I pressed the phone button and helloed",
              )
            ],
          ),
          Meaning(
            partOfSpeech: "noun",
            definitions: [
              Definition(
                definition: "A state of satisfaction.",
                example:
                    "the greater part of the century was a time of content",
                synonyms: [
                  "contentment",
                  "contentedness",
                  "satisfaction",
                  "fulfilment"
                ],
              ),
              Definition(
                definition:
                    "A member of the British House of Lords who votes for a particular motion.",
              ),
            ],
          ),
        ],
      ),
      Context(
        phonetics: [
          Phonetic(
            text: "/ˈkɑntɛnt/",
            audio: "https://lex-audio.useremarkable.com/mp3/xcontent_us_1.mp3",
          ),
        ],
        meanings: [
          Meaning(
            partOfSpeech: "noun",
            definitions: [
              Definition(
                definition:
                    "The things that are held or included in something.",
                synonyms: ["things inside", "content", "load"],
              ),
            ],
          ),
        ],
      )
    ],
  );

  test('Should be a subclass of WordMeaning entity', () async {
    // assert
    expect(tWordMeaningModel, isA<WordMeaning>());
  });

  group('fromJson', () {
    test(
        'should return wordmeaning with on context when JSON only has one object in list',
        () async {
      // arrange and act
      final result =
          WordMeaningModel.fromJson(fixture('word_meaning_storage.json'));

      // assert
      expect(result, equals(tWordMeaningModel));
    });
  });
}
