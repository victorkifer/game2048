import 'package:flutter/widgets.dart';
import 'package:two_zero_four_eight/logic/game.dart';
import 'package:two_zero_four_eight/mycolor.dart';
import 'package:two_zero_four_eight/tile.dart';

class Board extends StatelessWidget {
  final Game game;
  final double size;
  final double spacing;
  final double padding;

  Board(this.game, this.size, {this.spacing = 8.0, this.padding = 8.0});

  List<Widget> _buildChildren() {
    var children = <Widget>[];
    for (int x = 0; x < game.gridSize; x++) {
      for (int y = 0; y < game.gridSize; y++) {
        var piece = game.getGridValue(y, x);
        children.add(
          Positioned(
            top: y * size + y * spacing,
            left: x * size + x * spacing,
            child: Tile(piece, size, size),
          ),
        );
      }
    }
    return children;
  }

  Widget _buildGameOverWidget(double height) {
    return Container(
      height: height,
      color: Color(MyColor.transparentWhite),
      child: Center(
        child: Text(
          'Game over!',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.gridBackground)),
        ),
      ),
    );
  }

  Widget _buildGameWonWidget(double height) {
    return Container(
      height: height,
      color: Color(MyColor.transparentWhite),
      child: Center(
        child: Text(
          'You Won!',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Color(MyColor.gridBackground),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var boardSize =
        game.gridSize * size + ((game.gridSize - 1) * spacing + 2 * padding);
    return Container(
      width: boardSize,
      height: boardSize,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(padding),
            child: Stack(
              children: _buildChildren(),
            ),
          ),
          game.gameOver() ? _buildGameOverWidget(boardSize) : SizedBox(),
          game.gameWon() ? _buildGameWonWidget(boardSize) : SizedBox(),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(MyColor.gridBackground),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
