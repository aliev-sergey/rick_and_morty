part of 'character_list_bloc.dart';

@immutable
abstract class CharacterListState {}

class DataState extends CharacterListState {
  final DtoCharacterList characters;
  DataState(this.characters);
}

class LoadingState extends CharacterListState {}

class ErrorState extends CharacterListState {
  final dynamic error;
  ErrorState(this.error);
}