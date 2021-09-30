import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/network/models/dto_models/response/dto_character.dart';
import 'package:rick_and_morty/network/repository/global_repository.dart';

part 'character_card_event.dart';
part 'character_card_state.dart';

class CharacterCardBloc extends Bloc<CharacterCardEvent, CharacterCardState> {
  GlobalRepository _repository;
  String _id;
  CharacterCardBloc(this._repository, this._id) : super(LoadingState()) {
    on<InitialCharacterEvent>(
            (event, emit) => _buildInitialCharacterEvent(event, emit));
  }

  _buildInitialCharacterEvent(InitialCharacterEvent event, Emitter<CharacterCardState> emit) async {
    try {
      var character = await _repository.getCharacterInfoById(_id);
      emit(DataState(character));
    } catch(error) {
      emit(ErrorState(error));
    }
  }
}
