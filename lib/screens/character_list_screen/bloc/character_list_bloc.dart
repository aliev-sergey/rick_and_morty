import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/network/models/dto_models/response/dto_character_list.dart';
import 'package:rick_and_morty/network/repository/global_repository.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  GlobalRepository _repository;
  CharacterListBloc(this._repository) : super(LoadingState()) {
    on<InitialCharacterListEvent>(
            (event, emit) => _buildInitialCharacterListEvent(event, emit));
  }

  _buildInitialCharacterListEvent(InitialCharacterListEvent event, Emitter<CharacterListState> emit) async {
    try {
      var characterList = await _repository.getCharacterList();
      emit(DataState(characterList));
    } catch(error) {
      emit(ErrorState(error));
    }
  }

}
