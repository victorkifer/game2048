import 'dart:math';

import 'package:two_zero_four_eight/logic/grid.dart';
import 'package:two_zero_four_eight/logic/tuple.dart';

class GamingGrid {
  Grid grid;
  Random _random;

  GamingGrid(this.grid, {bool createStartPoints = true, Random random}) {
    if (random != null) {
      _random = random;
    } else {
      _random = new Random();
    }
    if (createStartPoints) {
      grid = _addNumber(grid);
      grid = _addNumber(grid);
    }
  }

  factory GamingGrid.copy(GamingGrid grid) {
    return GamingGrid(Grid.copy(grid.grid), createStartPoints: false);
  }

  int moveLeft() {
    Grid past = grid;
    var matrix = grid.getGrid();
    var score = 0;
    for (int i = 0; i < grid.size; i++) {
      var row = _slide(matrix[i]);
      var result = _combine(row, score);
      result = Tuple(result.item1, _slide(result.item2));
      score = result.item1;
      matrix[i] = result.item2;
    }
    grid = Grid.predefined(grid.size, matrix);

    var changed = past == grid;

    grid = _addNumber(grid);

    if (changed) {
      grid = _addNumber(grid);
    }
    return score;
  }

  int left() {
    var score = moveLeft();
    print(grid);
    print(score);
    return score;
  }

  int right() {
    grid = grid.rotate(180);
    var score = moveLeft();
    grid = grid.rotate(180);
    print(grid);
    print(score);
    return score;
  }

  int up() {
    grid = grid.rotate(270);
    var score = moveLeft();
    grid = grid.rotate(90);
    print(grid);
    print(score);
    return score;
  }

  int down() {
    grid = grid.rotate(90);
    var score = moveLeft();
    grid = grid.rotate(270);
    print(grid);
    print(score);
    return score;
  }

  Grid _addNumber(Grid grid) {
    var matrix = grid.getGrid();
    List<Tuple> options = [];
    for (int i = 0; i < grid.size; i++) {
      for (int j = 0; j < grid.size; j++) {
        if (matrix[i][j] == 0) {
          options.add(Tuple(i, j));
        }
      }
    }
    if (options.length > 0) {
      int spotRandomIndex = _random.nextInt(options.length);
      Tuple spot = options[spotRandomIndex];
      int r = _random.nextInt(100);
      matrix[spot.item1][spot.item2] = r > 80 ? 4 : 2;
    }

    return Grid.predefined(grid.size, matrix);
  }

  List<int> _slide(List<int> row) {
    List<int> arr = row.where((c) => c != 0).toList();
    int missing = row.length - arr.length;
    arr = arr + List.filled(missing, 0);
    return arr;
  }

  Tuple<int, List<int>> _combine(List<int> row, int score) {
    for (int i = 0; i < row.length - 1; i++) {
      int a = row[i];
      int b = row[i + 1];
      if (a == b) {
        row[i] = a + b;
        score += row[i];
        row[i + 1] = 0;
        i++;
      }
    }
    return Tuple(score, row);
  }
}
