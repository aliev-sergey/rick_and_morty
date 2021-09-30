import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/network/dio_wrapper/dio_wrapper.dart';
import 'package:rick_and_morty/network/models/dto_models/response/dto_character.dart';
import 'package:rick_and_morty/network/models/dto_models/response/dto_character_list.dart';

class NetworkService {
  late final DioWrapper _dioWrapper;
  late final String _baseUrl;

  void init(DioWrapper dioService, String baseUrl) {
    _dioWrapper = dioService;
    _baseUrl = baseUrl;
  }

  ///Method for fetching information about all characters
  Future<DtoCharacterList> getAllCharacters() async {
    var response = await _dioWrapper.dio.get('$_baseUrl/api/character');
    return DtoCharacterList.fromJson(response.data);
  }

  ///Method for fetching information about single character by id
  Future<DtoCharacter> getCharacterInfo(String id) async {
    var response = await _dioWrapper.dio.get('$_baseUrl/api/character/$id');
    return DtoCharacter.fromJson(response.data);
  }
}
