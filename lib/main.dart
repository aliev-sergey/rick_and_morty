import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/main/dependency_initializer/dependency_initializer.dart';
import 'package:rick_and_morty/main/dependency_provider/dependency_provider.dart';
import 'package:rick_and_morty/network/dio_wrapper/dio_wrapper.dart';
import 'package:rick_and_morty/network/repository/global_repository.dart';
import 'package:rick_and_morty/network/services/network_service.dart';
import 'package:rick_and_morty/screens/character_list_screen/character_list_screen.dart';
import 'package:rick_and_morty/styles/color_palette.dart';


const String projectBaseUrl = 'https://rickandmortyapi.com';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Future<bool> _initialize(BuildContext context) async {
    try {
      context.read<NetworkService>().init(DioWrapper(), projectBaseUrl);
      context.read<GlobalRepository>().init(context.read<NetworkService>());
    } catch (e, stackTrace) {
      ///Add firebase crashlytics
      print(e);
    }
    return true;
  }

  runApp(
    DependenciesProvider(
      child: MaterialApp(
        title: 'Rick and Morty app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: ColorPalette.secondary,
          ),
          scaffoldBackgroundColor: ColorPalette.primary,
          fontFamily: 'Sfui',
        ),
        home: DependenciesInitializer(
          loadingIndicatorScreen: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          initializer: _initialize,
          child: CharacterListScreen(),
        ),
      ),
    ),
  );
}
