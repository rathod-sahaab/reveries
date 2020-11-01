import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reveries/features/word_meaning/domain/entities/word_meaning.dart';
import 'package:reveries/features/word_meaning/domain/repositories/word_meaning_repository.dart';
import 'package:reveries/features/word_meaning/domain/usecases/get_word_meaning.dart';

class MockWordMeaningRepository extends Mock implements WordMeaningRepository {}

void main() {
  GetWordMeaning usecase;
  MockWordMeaningRepository mockWordMeaningRepository;
  setUp(() {
    mockWordMeaningRepository = MockWordMeaningRepository();
    usecase = GetWordMeaning(mockWordMeaningRepository);
  });

  final tWord = "hello";
  // test data
  final tWordMeaning = WordMeaning(
    word: "hello",
    contexts: [
      Context(
        phonetics: [
          Phonetic(
            text: "/həˈloʊ/",
            audio: "https://lex-audio.useremarkable.com/mp3/hello_us_1_rr.mp3",
          ),
          Phonetic(
            text: "/hɛˈloʊ/",
            audio: "https://lex-audio.useremarkable.com/mp3/hello_us_2_rr.mp3",
          ),
        ],
        meanings: [
          Meaning(
            partOfSpeech: "exclamation",
            definitions: [
              Definition(
                definition:
                    "Used as a greeting or to begin a phone conversation.",
                example: "hello there, Katie!",
              )
            ],
          ),
          Meaning(
            partOfSpeech: "noun",
            definitions: [
              Definition(
                  definition: 'An utterance of “hello”; a greeting.',
                  example: "she was getting polite nods and hellos from people",
                  synonyms: [
                    "greeting",
                    "welcome",
                    "salutation",
                    "saluting",
                    "hailing",
                    "address",
                    "hello",
                    "hallo",
                  ])
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
        ],
      ),
    ],
  );

  test('should get meaning of the word from repository', () async {
    // arrange
    when(mockWordMeaningRepository.getWordMeaning(any))
        .thenAnswer((_) async => Right(tWordMeaning));
    // act
    final result = await usecase(Params(word: tWord));

    //assert
    expect(result, Right(tWordMeaning));
    verify(mockWordMeaningRepository.getWordMeaning(tWord));
    verifyNoMoreInteractions(mockWordMeaningRepository);
  });
}
