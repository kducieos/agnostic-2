import 'package:flutter/material.dart';
import '../services/progress_service.dart';
import '../widgets/responsive_scaffold.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({super.key});

  static const int maxLevel = 3;

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'Select Level',
      child: FutureBuilder<List<bool>>(
        future: ProgressService.loadLevels(maxLevel),
        builder: (context, snapshot) {
          final completed = snapshot.data ?? List.filled(maxLevel, false);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Choose a level:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              for (int i = 0; i < maxLevel; i++)
                Card(
                  child: ListTile(
                    title: Text('Level ${i + 1}'),
                    subtitle: Text(
                      completed[i] ? 'Completed' : 'Not completed yet',
                    ),
                    trailing: const Icon(Icons.play_arrow),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/game',
                        arguments: i + 1,
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
