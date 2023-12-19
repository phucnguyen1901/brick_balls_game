import 'dart:async';
import 'dart:math';

import 'package:brick_balls_game/screens/game_screen/game_screen.dart';
import 'package:flame/components.dart';

import 'ball_more.dart';
import 'brick.dart';

class NewBoard extends RectangleComponent with HasGameRef<MainGame> {
  @override
  FutureOr<void> onLoad() async {
    addRowBrick();
    return super.onLoad();
  }

  reset() {
    final allNewBrickComponents = children.query<NewBrick>();
    for (var brick in allNewBrickComponents) {
      brick.removeFromParent();
    }
    final allBallMoreComponents = children.query<BallMore>();
    for (var ballMore in allBallMoreComponents) {
      ballMore.removeFromParent();
    }
  }

  moveBrick() {
    final allNewBrickComponents = children.query<NewBrick>();
    for (var brick in allNewBrickComponents) {
      brick.position.y += 50;
      if (brick.position.y >= game.size.y * 0.9) {
        game.overlays.add('game-over');
      }
    }
    final allBallMoreComponents = children.query<BallMore>();
    for (var ballMore in allBallMoreComponents) {
      ballMore.position.y += 50;
      if (ballMore.position.y >= game.size.y * 0.9) {
        game.overlays.add('game-over');
        game.pauseEngine();
      }
    }
  }

  addRowBrick() async {
    var brickNumber = Random().nextInt(3) + 1;
    List position1 = [1, 3, 5, 7];
    List position2 = [2, 4, 6, 8];
    position1.shuffle();
    position2.shuffle();
    var isPosition1 = Random().nextBool();
    var currentPosition = isPosition1 ? position1 : position2;

    for (var i = 0; i < brickNumber; i++) {
      var spacer = 20;
      if (currentPosition[i] == 1) {
        spacer = 0;
      }
      if (currentPosition[i] == 8) {
        spacer = 0;
      }
      var score = Random().nextInt(10) + 1;
      var randomBall = Random().nextInt(6);
      if (game.ballNumber >= 10) {
        score = Random().nextInt(80) + 25;
        randomBall = Random().nextInt(8);
      } else if (game.ballNumber >= 5) {
        score = Random().nextInt(50) + 15;
        randomBall = Random().nextInt(6);
      } else if (game.ballNumber >= 3) {
        score = Random().nextInt(30) + 5;
      }

      if (randomBall == 0) {
        BallMore ballMore = BallMore(
            position:
                Vector2(game.size.x * currentPosition[i] / 10 + spacer, 50),
            score: 1);
        add(ballMore);
      } else {
        NewBrick newBrick = NewBrick(
            position:
                Vector2(game.size.x * currentPosition[i] / 10 + spacer, 50),
            score: score);
        add(newBrick);
      }
    }
  }
}
