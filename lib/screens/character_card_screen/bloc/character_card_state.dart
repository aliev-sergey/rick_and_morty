part of 'character_card_bloc.dart';

@immutable
abstract class CharacterCardState {}

class DataState extends CharacterCardState {
  final DtoCharacter character;
  DataState(this.character);
}

class LoadingState extends CharacterCardState {}

class ErrorState extends CharacterCardState {
  final dynamic error;
  ErrorState(this.error);
}
