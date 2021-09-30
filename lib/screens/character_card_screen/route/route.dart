import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/network/repository/global_repository.dart';
import 'package:rick_and_morty/screens/character_card_screen/bloc/character_card_bloc.dart';
import 'package:rick_and_morty/screens/character_card_screen/character_card_screen.dart';

MaterialPageRoute routeCharacterCard(String id) {
  return MaterialPageRoute(
    builder: (context) => BlocProvider<CharacterCardBloc>(
      create: (context) => CharacterCardBloc(context.read<GlobalRepository>(), id)..add(InitialCharacterEvent()),
      child: CharacterCardScreen(),
    ),
  );
}