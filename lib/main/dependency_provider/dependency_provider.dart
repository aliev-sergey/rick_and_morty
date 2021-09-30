import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/network/repository/global_repository.dart';
import 'package:rick_and_morty/network/services/network_service.dart';

///Providers for global managers
class DependenciesProvider extends StatelessWidget {
  final Widget child;

  const DependenciesProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (_) => NetworkService(),
        ),
        RepositoryProvider(
          create: (_) => GlobalRepository(),
        ),
      ],
      child: child,
    );
  }
}
