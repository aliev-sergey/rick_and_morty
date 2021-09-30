import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/screens/character_card_screen/bloc/character_card_bloc.dart';
import 'package:rick_and_morty/styles/text_styles.dart';
import 'package:rick_and_morty/widgets/description_item.dart';
import 'package:rick_and_morty/widgets/loading_indicator.dart';
import 'package:rick_and_morty/widgets/main_app_bar.dart';

class CharacterCardScreen extends StatelessWidget {
  const CharacterCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCardBloc, CharacterCardState>(
        buildWhen: (p, c) => (c is DataState || c is LoadingState),
        builder: (context, state) {
          if (state is LoadingState) {
            return LoadingIndicator();
          }
          if (state is DataState) {
            return _BuildScaffold(state: state);
          }
          return SizedBox.shrink();
        });
  }
}

class _BuildScaffold extends StatelessWidget {
  final DataState state;
  const _BuildScaffold({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: state.character.name ?? ''),
      body: _BuildBody(state: state),
    );
  }
}

class _BuildBody extends StatelessWidget {
  final DataState state;
  const _BuildBody({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 87.0,
            backgroundImage: Image.network(state.character.image ?? '').image,
          ),
          const SizedBox(height: 20.0),
          Text(
            '${state.character.status} - ${state.character.species}',
            style: ProjectTextStyles.ui_15Regular,
          ),
          const SizedBox(height: 35.0),
          DescriptionItem(
            title: 'Origin location',
            subtitle: state.character.origin?.name ?? '',
          ),
          DescriptionItem(
            title: 'Gender',
            subtitle: state.character.location?.name ?? '',
          ),
          DescriptionItem(
            title: 'Location',
            subtitle: state.character.location?.name ?? '',
          ),
        ],
      ),
    );
  }
}
