import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';

class GameResultArgs {
  final int level;
  final Duration time;

  GameResultArgs({required this.level, required this.time});
}

class ResultScreen extends StatelessWidget {
  final GameResultArgs args;

  const ResultScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final seconds = args.time.inMilliseconds / 1000.0;

    return ResponsiveScaffold(
      title: 'Result',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Level ${args.level} completed!',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text('Time: ${seconds.toStringAsFixed(1)} seconds'),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/levels',
              (route) => route.isFirst,
            ),
            child: const Text('Back to levels'),
          ),
        ],
      ),
    );
  }
}
