import 'package:two_zero_four_eight/logic/gaming_grid.dart';
import 'package:two_zero_four_eight/logic/grid.dart';

class Game {
  static const int GAME_WON_SCORE = 2048;

  GamingGrid _gamingGrid;
  GamingGrid _previousGrid;

  int _score = 0;
  int _previousScore = 0;
  bool _gameOver = false;
  bool _gameWon = false;
  bool _endlessMode = false;

  final int gridSize;

  Game(this.gridSize) {
    resetGame();
  }

  void resetGame() {
    _gamingGrid = GamingGrid(Grid(gridSize));
    _previousGrid = null;
    _score = 0;
    _previousScore = 0;
    _gameOver = false;
    _gameWon = false;
    _endlessMode = false;
  }

  void stepBack() {
    if (_previousGrid != null) {
      _gamingGrid = _previousGrid;
      _score = _previousScore;
      _previousGrid = null;
      if (_gameOver) {
        _gameOver = false;
      }
    }
  }

  bool canUndo() {
    return _previousGrid != null;
  }

  int getGridValue(int i, int j) {
    return _gamingGrid.grid.getGrid()[i][j];
  }

  int getScore() {
    return _score;
  }

  bool gameOver() {
    return _gameOver;
  }

  bool gameWon() {
    return _gameWon;
  }

  void moveLeft() {
    if (_gameOver || (_gameWon && !_endlessMode)) {
      return;
    }
    _previousGrid = GamingGrid.copy(_gamingGrid);
    _previousScore = _score;
    _score += _gamingGrid.left();
    checkState();
  }

  void moveRight() {
    if (_gameOver || (_gameWon && !_endlessMode)) {
      return;
    }
    _previousGrid = GamingGrid.copy(_gamingGrid);
    _previousScore = _score;
    _score += _gamingGrid.right();
    checkState();
  }

  void moveUp() {
    if (_gameOver || (_gameWon && !_endlessMode)) {
      return;
    }
    _previousGrid = GamingGrid.copy(_gamingGrid);
    _previousScore = _score;
    _score += _gamingGrid.up();
    checkState();
  }

  void moveDown() {
    if (_gameOver || (_gameWon && !_endlessMode)) {
      return;
    }
    _previousGrid = GamingGrid.copy(_gamingGrid);
    _previousScore = _score;
    _score += _gamingGrid.down();
    checkState();
  }

  void setEndlessMode() {
    _gameWon = false;
    _endlessMode = true;
  }

  void checkState() {
    bool gameOverLocal = _isGameOver(_gamingGrid.grid.getGrid());
    if (gameOverLocal) {
      print('GAME OVER');
      _gameOver = true;
    }

    bool gameWonLocal = !_endlessMode && _isGameWon(_gamingGrid.grid.getGrid());
    if (gameWonLocal) {
      print("GAME WON");
      _gameWon = true;
    }
  }

  static bool _isGameWon(List<List<int>> grid) {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == GAME_WON_SCORE) {
          return true;
        }
      }
    }
    return false;
  }

  static bool _isGameOver(List<List<int>> grid) {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == 0) {
          return false;
        }
        if (i != grid.length - 1 && grid[i][j] == grid[i + 1][j]) {
          return false;
        }
        if (j != grid[i].length - 1 && grid[i][j] == grid[i][j + 1]) {
          return false;
        }
      }
    }
    return true;
  }
}
