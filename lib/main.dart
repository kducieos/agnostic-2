import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'screens/level_select_screen.dart';
import 'screens/game_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const MemoryGameApp());
}

class MemoryGameApp extends StatelessWidget {
  const MemoryGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const StartScreen(),
        '/levels': (_) => const LevelSelectScreen(),
        '/game': (ctx) {
          final level = ModalRoute.of(ctx)!.settings.arguments as int;
          return GameScreen(level: level);
        },
        '/result': (ctx) {
          final args =
              ModalRoute.of(ctx)!.settings.arguments as GameResultArgs;
          return ResultScreen(args: args);
        },
      },
    );
  }
}
