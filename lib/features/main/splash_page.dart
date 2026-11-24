import 'package:material_ui/material_ui.dart';

import '../../core/extensions/build_context_ext.dart';
import '../../core/style/color/colors_app.dart';
import '../auth/data/datasource/auth_local_datasource.dart';
import '../auth/presentation/pages/login_page.dart';
import 'main_nav.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final Future<bool> _authFuture;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _authFuture = AuthLocalDatasource().isAuth();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: FutureBuilder(
        future: _authFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingScreen(screenWidth, screenHeight);
          }

          if (!_hasNavigated) {
            _hasNavigated = true;
            final isAuth = snapshot.hasData && snapshot.data == true;

            Future.microtask(() async {
              await Future.delayed(const Duration(seconds: 2));
              if (!context.mounted) return;

              if (isAuth) {
                context.pushReplacement(MainNav());
              } else {
                context.pushReplacement(const LoginPage());
              }
            });
          }

          return loadingScreen(screenWidth, screenHeight);
        },
      ),
    );
  }
}

Container loadingScreen(double screenWidth, double screenHeight) {
  return Container(
    width: screenWidth,
    height: screenHeight,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [ColorsApp.primary, ColorsApp.backgroundColor.withAlpha(200)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: SafeArea(
      child: Center(
        child: Image.asset(
          'assets/images/logo_brida.png',
          fit: BoxFit.contain,
          height: 350,
          width: 350,
        ),
      ),
    ),
  );
}
