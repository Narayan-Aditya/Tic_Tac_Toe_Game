import 'dart:io';

List<List<String>> matrix = [
  ['1', '2', '3'],
  ['4', '5', '6'],
  ['7', '8', '9']
];
var firstPlayer, secondPlayer;
var row, column;
var token = 'X';
var drawGame = false;

void displayPlayground() {
  print('    |     |   ');
  print('  ${matrix[0][0]} |  ${matrix[0][1]}  |  ${matrix[0][2]} ');
  print('____|_____|_____');
  print('    |     |   ');
  print('  ${matrix[1][0]} |  ${matrix[1][1]}  |  ${matrix[1][2]} ');
  print('____|_____|_____');
  print('    |     |   ');
  print('  ${matrix[2][0]} |  ${matrix[2][1]}  |  ${matrix[2][2]} ');
  print('    |     |   \n');
}

bool checkResult() {
  for (int i = 0; i < 3; i++) {
    if (matrix[i][0] == matrix[i][1] && matrix[i][0] == matrix[i][2] ||
        matrix[0][i] == matrix[1][i] && matrix[0][i] == matrix[2][i]) {
      return true;
    }
  }
  if (matrix[0][0] == matrix[1][2] && matrix[0][0] == matrix[2][2] ||
      matrix[0][2] == matrix[1][1] && matrix[0][2] == matrix[2][0]) {
    return true;
  }
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (matrix[i][j] != 'X' && matrix[i][j] != 'O') {
        return false;
      }
    }
  }
  drawGame = true;
  return true;
}

void playGroundInput() {
  int? place;

  if (token == 'X') {
    stdout.write('$firstPlayer enter { X } position : ');
    place = int.parse(stdin.readLineSync()!);
  }
  if (token == 'O') {
    stdout.write('$secondPlayer enter { O } position : ');
    place = int.parse(stdin.readLineSync()!);
  }
  if (place == 1) {
    row = 0;
    column = 0;
  }
  if (place == 2) {
    row = 0;
    column = 1;
  }
  if (place == 3) {
    row = 0;
    column = 2;
  }
  if (place == 4) {
    row = 1;
    column = 0;
  }
  if (place == 5) {
    row = 1;
    column = 1;
  }
  if (place == 6) {
    row = 1;
    column = 2;
  }
  if (place == 7) {
    row = 2;
    column = 0;
  }
  if (place == 8) {
    row = 2;
    column = 1;
  }
  if (place == 9) {
    row = 2;
    column = 2;
  }
  if (token == 'X' &&
      matrix[row][column] != 'X' &&
      matrix[row][column] != 'O') {
    matrix[row][column] = 'X';
    token = 'O';
  } else if (token == 'O' &&
      matrix[row][column] != 'X' &&
      matrix[row][column] != 'O') {
    matrix[row][column] = 'O';
    token = 'X';
  } else {
    print('There is no empty space');
    playGroundInput();
  }
}

main() {
  // Takeing players name >
  stdout.write('Player 01 name : ');
  firstPlayer = stdin.readLineSync();
  stdout.write('Player 02 name : ');
  secondPlayer = stdin.readLineSync();

  //showing player X and O
  print('$firstPlayer got { X }\n$secondPlayer got { O }\n');

  while (!checkResult()) {
    displayPlayground();
    playGroundInput();
    checkResult();
  }

  if (token == 'O' && drawGame == false) {
    displayPlayground();
    print("$firstPlayer Wins\n");
  } else if (token == 'X' && drawGame == false) {
    displayPlayground();
    print("$secondPlayer Wins\n");
  } else {
    displayPlayground();
    print("It's a draw match\n");
  }
}
