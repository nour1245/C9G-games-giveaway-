import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_games/blocobserver.dart';

import 'modules/home_screen.dart';
import 'shared/network/local/cash_helper.dart';
import 'shared/network/remote/diohelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        popupMenuTheme:
            const PopupMenuThemeData(color: Color.fromARGB(255, 204, 204, 204)),
        cardTheme: const CardTheme(
          color: Color.fromARGB(255, 51, 51, 51),
        ),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Color.fromARGB(255, 204, 204, 204)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Color.fromARGB(255, 204, 204, 204),
              fontSize: 15,
            )),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        primarySwatch: const MaterialColor(0xFFFFD300, {
          50: Color(0xFFFFF8D1),
          100: Color(0xFFFFEDB3),
          200: Color(0xFFFFE186),
          300: Color(0xFFFFD55A),
          400: Color(0xFFFFCB38),
          500: Color(0xFFFFD300),
          600: Color(0xFFFFC900),
          700: Color(0xFFFFC000),
          800: Color(0xFFFFB700),
          900: Color(0xFFFFA600),
        }),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
