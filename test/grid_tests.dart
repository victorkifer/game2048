import 'package:test_api/test_api.dart';
import 'package:two_zero_four_eight/logic/grid.dart';

void main() {
  test('Test grid flip', () {
    var grid = Grid.predefined(4, [
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4]
    ]);
    var transposed = grid.flip();
    var expected = Grid.predefined(4, [
      [4, 3, 2, 1],
      [4, 3, 2, 1],
      [4, 3, 2, 1],
      [4, 3, 2, 1]
    ]);
    expect(transposed, equals(expected));
  });

  test('Test grid transpose', () {
    var grid = Grid.predefined(4, [
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4]
    ]);
    var transposed = grid.transpose();
    var expected = Grid.predefined(4, [
      [1, 1, 1, 1],
      [2, 2, 2, 2],
      [3, 3, 3, 3],
      [4, 4, 4, 4]
    ]);
    expect(transposed, equals(expected));
  });

  test('Test grid rotate 90', () {
    var grid = Grid.predefined(4, [
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4]
    ]);
    var rotated = grid.rotate(90);
    var expected = Grid.predefined(4, [
      [1, 1, 1, 1],
      [2, 2, 2, 2],
      [3, 3, 3, 3],
      [4, 4, 4, 4]
    ]);
    expect(rotated, equals(expected));
  });

  test('Test grid rotate 180', () {
    var grid = Grid.predefined(4, [
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4]
    ]);
    var rotated = grid.rotate(180);
    var expected = Grid.predefined(4, [
      [4, 3, 2, 1],
      [4, 3, 2, 1],
      [4, 3, 2, 1],
      [4, 3, 2, 1]
    ]);
    expect(rotated, equals(expected));
  });

  test('Test grid rotate 270', () {
    var grid = Grid.predefined(4, [
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4]
    ]);
    var rotated = grid.rotate(270);
    var expected = Grid.predefined(4, [
      [4, 4, 4, 4],
      [3, 3, 3, 3],
      [2, 2, 2, 2],
      [1, 1, 1, 1]
    ]);
    expect(rotated, equals(expected));
  });

  test('Transpose = Rotate 90', () {
    var grid = Grid.predefined(4, [
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4]
    ]);
    var rotated = grid.rotate(90);
    var expected = grid.transpose();
    expect(rotated, equals(expected));
  });

  test('Flip = Rotate 180', () {
    var grid = Grid.predefined(4, [
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4]
    ]);
    var rotated = grid.rotate(180);
    var expected = grid.flip();
    expect(rotated, equals(expected));
  });

  test('Flip + Transpose = Rotate 270', () {
    var grid = Grid.predefined(4, [
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4],
      [1, 2, 3, 4]
    ]);
    var rotated = grid.rotate(270);
    var expected = grid.flip().transpose();
    expect(rotated, equals(expected));
  });
}
