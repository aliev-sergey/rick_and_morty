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
import 'package:rick_and_morty/network/models/dto_models/response/dto_character_list.dart';
import 'package:rick_and_morty/network/repository/global_repository.dart';
import 'package:rick_and_morty/screens/character_list_screen/bloc/character_list_bloc.dart';


class MockGlobalRepository extends Mock implements GlobalRepository {}

void main() {
  group(
    'CharacterListBloc_InitialCharacterListEvent',
        () {
      var globalRepository;
      setUp(() {
        globalRepository = MockGlobalRepository();
      });

      blocTest<CharacterListBloc, CharacterListState>(
        'GIVEN user want find out information about character '
            'WHEN user tap on list item on character list screen'
            'THEN Bloc emit data state',
        setUp: () {
          when(() => globalRepository.getCharacterList()).thenAnswer((_) => Future<DtoCharacterList>.value(DtoCharacterList()));
        },
        build: () => CharacterListBloc(globalRepository),
        act: (CharacterListBloc bloc) async => bloc.add(InitialCharacterListEvent()),
        expect: () => [
          isA<DataState>(),
        ],
      );

      blocTest<CharacterListBloc, CharacterListState>(
        'GIVEN user want find out information about character '
            'WHEN user tap on list item on character list screen'
            'THEN Bloc emit data state',
        setUp: () {
          when(() => globalRepository.getCharacterList()).thenThrow(Exception('Something went wrong'));
        },
        build: () => CharacterListBloc(globalRepository),
        act: (CharacterListBloc bloc) async => bloc.add(InitialCharacterListEvent()),
        expect: () => [
          isA<ErrorState>(),
        ],
      );
    },
  );
}
