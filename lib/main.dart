import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import 'core/style/theme/bright_theme.dart';
import 'features/auth/data/datasource/auth_remote_datasourec.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/main/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRemoteDatasource(),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRemoteDatasource>()),
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
