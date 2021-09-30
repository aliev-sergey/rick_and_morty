// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/network/models/dto_models/response/dto_character.dart';
import 'package:rick_and_morty/network/repository/global_repository.dart';
import 'package:rick_and_morty/screens/character_card_screen/bloc/character_card_bloc.dart';


class MockGlobalRepository extends Mock implements GlobalRepository {}

void main() {

  group(
    'CharacterCardBloc_InitialCharacterEvent',
        () {
      var globalRepository;
      setUp(() {
        globalRepository = MockGlobalRepository();
      });

      blocTest<CharacterCardBloc, CharacterCardState>(
        'GIVEN user want find out information about character '
            'WHEN user tap on list item on character list screen'
            'THEN Bloc emit data state',
        setUp: () {
          when(() => globalRepository.getCharacterInfoById('1')).thenAnswer((_) => Future<DtoCharacter>.value(DtoCharacter()));
        },
        build: () => CharacterCardBloc(globalRepository, '1'),
        act: (CharacterCardBloc bloc) async => bloc.add(InitialCharacterEvent()),
        expect: () => [
          isA<DataState>(),
        ],
      );

      blocTest<CharacterCardBloc, CharacterCardState>(
        'GIVEN user want find out information about character '
            'WHEN user tap on list item on character list screen, but error happens'
            'THEN Bloc emit error state',
        setUp: () {
          when(() => globalRepository.getCharacterInfoById('1').thenThrow(Exception('Something went wrong')));
        },
        build: () => CharacterCardBloc(globalRepository, '1'),
        act: (CharacterCardBloc bloc) async => bloc.add(InitialCharacterEvent()),
        expect: () => [
          isA<ErrorState>(),
        ],
      );
    },
  );
}
