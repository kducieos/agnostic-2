import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'memory_game.dart';

class CardComponent extends PositionComponent with TapCallbacks {
  final int pairId;
  final MemoryGame game;

  bool isFaceUp = false;
  bool isMatched = false;

  CardComponent({
    required this.pairId,
    required this.game,
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size);

  Color get _color {
    final baseColors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.brown,
    ];
    return baseColors[pairId % baseColors.length];
  }

  @override
  void render(Canvas canvas) {
    final rect = size.toRect();
    final paint = Paint()
      ..color = isMatched
          ? Colors.grey.shade400
          : (isFaceUp ? _color : Colors.blueGrey.shade700);

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(8)),
      paint,
    );
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    game.onCardTapped(this);
  }
}
