import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import 'core/style/theme/bright_theme.dart';
import 'features/auth/data/datasource/auth_remote_datasourec.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/data/datasource/home_remote_datasource.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/main/splash_page.dart';
import 'features/presence/data/datasource/presence_remote_datasource.dart';
import 'features/presence/presentation/bloc/presence/presence_bloc.dart';
import 'features/presence/presentation/bloc/presence_history/presence_history_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRemoteDatasource()),
        RepositoryProvider(create: (context) => HomeRemoteDatasource()),
        RepositoryProvider(create: (context) => PresenceRemoteDatasource()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRemoteDatasource>()),
          ),
          BlocProvider(
            create: (context) => HomeBloc(context.read<HomeRemoteDatasource>()),
          ),
          BlocProvider(
            create: (context) =>
                PresenceBloc(context.read<PresenceRemoteDatasource>()),
          ),
          BlocProvider(
            create: (context) =>
                PresenceHistoryBloc(context.read<PresenceRemoteDatasource>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bright Semarang',
          theme: BrightTheme.lightTheme,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
