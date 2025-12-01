import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'card_component.dart';

typedef GameCompletedCallback = void Function(Duration time);

class MemoryGame extends FlameGame {
  final int level;
  final GameCompletedCallback onCompleted;

  MemoryGame({
    required this.level,
    required this.onCompleted,
  }) : super(
          camera: CameraComponent.withFixedResolution(
            width: 400,
            height: 600,
          ),
        );

  final Stopwatch _stopwatch = Stopwatch();
  CardComponent? _firstSelected;
  CardComponent? _secondSelected;
  int _matchedPairs = 0;
  late int _pairCount;

  @override
  Color backgroundColor() => const Color(0xfff2e8cf);

  @override
  FutureOr<void> onLoad() {
    // ⭐ 这一行是关键：让 (0,0) 变成左上角，而不是画面中心
    camera.viewfinder.anchor = Anchor.topLeft;

    _pairCount = switch (level) {
      1 => 3, // 6 张卡
      2 => 6, // 12 张
      _ => 8, // 16 张
    };

    _createCards();
    _stopwatch.start();
    return super.onLoad();
  }

  void _createCards() {
    final totalCards = _pairCount * 2;
    final columns = 4;
    final rows = (totalCards / columns).ceil();

    const padding = 16.0;
    final cardWidth = (size.x - padding * (columns + 1)) / columns;
    final cardHeight = (size.y - padding * (rows + 1)) / rows;

    final ids = <int>[];
    for (int i = 0; i < _pairCount; i++) {
      ids.add(i);
      ids.add(i);
    }
    ids.shuffle(Random());

    int index = 0;
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        if (index >= ids.length) break;
        final pairId = ids[index++];
        final x = padding + col * (cardWidth + padding);
        final y = padding + row * (cardHeight + padding);

        final card = CardComponent(
          pairId: pairId,
          game: this,
          position: Vector2(x, y),
          size: Vector2(cardWidth, cardHeight),
        );
        world.add(card);
      }
    }
  }

  Future<void> onCardTapped(CardComponent card) async {
    if (card.isMatched || card.isFaceUp) return;
    if (_secondSelected != null) return;

    card.isFaceUp = true;

    if (_firstSelected == null) {
      _firstSelected = card;
      return;
    }

    _secondSelected = card;

    if (_firstSelected!.pairId == _secondSelected!.pairId) {
      _firstSelected!.isMatched = true;
      _secondSelected!.isMatched = true;
      _matchedPairs++;

      _firstSelected = null;
      _secondSelected = null;

      if (_matchedPairs == _pairCount) {
        _stopwatch.stop();
        onCompleted(_stopwatch.elapsed);
      }
    } else {
      final first = _firstSelected!;
      final second = _secondSelected!;
      await Future.delayed(const Duration(milliseconds: 700));
      first.isFaceUp = false;
      second.isFaceUp = false;
      _firstSelected = null;
      _secondSelected = null;
    }
  }
}
