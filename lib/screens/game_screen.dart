import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../game/memory_game.dart';
import '../services/progress_service.dart';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  final int level;

  const GameScreen({super.key, required this.level});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final MemoryGame _game;

  @override
  void initState() {
    super.initState();
    _game = MemoryGame(
      level: widget.level,
      onCompleted: (duration) async {
        await ProgressService.setLevelCompleted(widget.level);
        if (!mounted) return;
        Navigator.pushReplacementNamed(
          context,
          '/result',
          arguments: GameResultArgs(
            level: widget.level,
            time: duration,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${widget.level}'),
      ),
      body: Center(
        // 限制游戏区域大小，避免在超宽屏上被拉得很怪
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
               width: 400,
               height: 600,
               child: GameWidget(game: _game),
            );
          }
        ),
      ),
    );
  }
}
