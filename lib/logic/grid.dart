import 'dart:math';

class Grid {
  List<List<int>> _grid;
  final int size;

  Grid(this.size) {
    _grid = _blankGrid(size);
  }

  factory Grid.copy(Grid grid) {
    return Grid.predefined(grid.size, grid.getGrid());
  }

  Grid.predefined(this.size, List<List<int>> grid) {
    assert(grid.length == size);
    for (var row in grid) {
      assert(row.length == size);
    }
    this._grid = grid;
  }

  Grid flip() {
    return Grid.predefined(size, _flipGrid(_grid));
  }

  Grid transpose() {
    return Grid.predefined(size, _transposeGrid(_grid));
  }

  Grid rotate(int angle) {
    assert(angle % 90 == 0, "Angle should divide by 90");
    return Grid.predefined(size, _rotate(_grid, angle));
  }

  List<List<int>> getGrid() {
    return _copyGrid(_grid);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Grid &&
            _compare(_grid, other._grid);
  }

  @override
  String toString() {
    return 'Grid{_grid: $_grid, size: $size}';
  }

  static bool _compare(List<List<int>> a, List<List<int>> b) {
    for (int i = 0; i < a.length; i++) {
      for (int j = 0; j < a[i].length; j++) {
        if (a[i][j] != b[i][j]) {
          return false;
        }
      }
    }
    return true;
  }

  static List<List<int>> _rotate(List<List<int>> grid, int angle) {
    var newGrid = _blankGrid(grid.length);

    var offsetX = grid.length - 1, offsetY = grid[0].length - 1;
    if (angle == 90) {
      offsetX = 0;
    } else if (angle == 270) {
      offsetY = 0;
    }

    var rad = angle * -(pi / 180.0);
    var cosA = cos(rad).toInt();
    var sinA = sin(rad).toInt();
    for (var x = 0; x < grid.length; x++) {
      for (int y = 0; y < grid.length; y++) {
        var newX = (x * cosA) - (y * sinA) + offsetX;
        var newY = (x * sinA) + (y * cosA) + offsetY;
        newGrid[newX][newY] = grid[x][y];
      }
    }
    return newGrid;
  }

  static List<List<int>> _copyGrid(List<List<int>> grid) {
    List<List<int>> extraGrid = _blankGrid(grid.length);
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        extraGrid[i][j] = grid[i][j];
      }
    }
    return extraGrid;
  }

  static List<List<int>> _flipGrid(List<List<int>> grid) {
    for (int i = 0; i < grid.length; i++) {
      List<int> row = grid[i];
      grid[i] = row.reversed.toList();
    }
    return grid;
  }

  static List<List<int>> _transposeGrid(List<List<int>> grid) {
    List<List<int>> newGrid = _blankGrid(grid.length);
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        newGrid[i][j] = grid[j][i];
      }
    }
    return newGrid;
  }

  static List<List<int>> _blankGrid(int size) {
    List<List<int>> rows = [];
    for (int i = 0; i < size; i++) {
      rows.add(List.filled(size, 0));
    }
    return rows;
  }
}
