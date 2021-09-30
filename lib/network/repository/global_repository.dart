import 'package:rick_and_morty/network/models/dto_models/response/dto_character.dart';
import 'package:rick_and_morty/network/models/dto_models/response/dto_character_list.dart';
import 'package:rick_and_morty/network/services/network_service.dart';

class GlobalRepository {
  late final NetworkService _networkService;

  void init(NetworkService networkService,) {
    _networkService = networkService;
  }

  ///Repository method for fetching information about all characters
  Future<DtoCharacterList> getCharacterList() => _networkService.getAllCharacters();

  ///Repository method for fetching information about character by id
  Future<DtoCharacter> getCharacterInfoById(String id) => _networkService.getCharacterInfo(id);
}
