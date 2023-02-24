import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/presentation/utils/repo_barrel.dart';

class RepoProvider extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const RepoProvider({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => RepositoryBarrel.userRepo),
        RepositoryProvider(create: (context) => RepositoryBarrel.moodRepo),
        RepositoryProvider(create: (context) => RepositoryBarrel.journalRepo),
      ],
      child: Builder(builder: builder),
    );
  }
}
