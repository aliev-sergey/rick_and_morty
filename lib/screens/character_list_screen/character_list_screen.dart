import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/network/repository/global_repository.dart';
import 'package:rick_and_morty/screens/character_card_screen/route/route.dart';
import 'package:rick_and_morty/screens/character_list_screen/bloc/character_list_bloc.dart';
import 'package:rick_and_morty/styles/text_styles.dart';
import 'package:rick_and_morty/widgets/character_list_item.dart';
import 'package:rick_and_morty/widgets/loading_indicator.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and morty', style: ProjectTextStyles.ui_17Regular,),
        centerTitle: true,
      ),
      body: _BuildBody(),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: BlocProvider<CharacterListBloc>(
        create: (context) => CharacterListBloc(context.read<GlobalRepository>())
          ..add(InitialCharacterListEvent()),
        child: BlocBuilder<CharacterListBloc, CharacterListState>(
          buildWhen: (p, c) => (c is DataState || c is LoadingState),
          builder: (context, state) {
            if (state is LoadingState) {
              return LoadingIndicator();
            }
            if (state is DataState) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  key: PageStorageKey<String>('characterListScreen'),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = state.characters.results?[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: CharacterListItem(
                        image: item?.image ?? '',
                        title: item?.name ?? '',
                        subtitle: '${item?.status} - ${item?.species}',
                        gender: item?.gender ?? '',
                        onTapHandler: () {
                          Navigator.push(context, routeCharacterCard(item?.id.toString() ?? ''));
                        },
                      ),
                    );
                  },
                  itemCount: state.characters.results?.length,
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
