int[][] board = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};
int turn = 1;
int winner = 0;
long time = 0;
int scoreX = 0;
int score0 = 0;
boolean scored = false;
void setup() {


  size(800, 800);
}
void draw() {
  background(#B9FFFE);
  fill(0);
  textSize(90);
  textAlign(LEFT, CENTER);
  text("x : "  + scoreX, 50, 50);
  textAlign(RIGHT, CENTER);
  text("o : " + score0, 750, 50);
  strokeWeight(20);
  stroke(0);
  line(300, 100, 300, 700);
  line(500, 100, 500, 700);
  line(100, 300, 700, 300);
  line(100, 500, 700, 500);
  for (int y = 0; y < 3; y++)
  {
    for (int x =0; x < 3; x++ )
    {
      if (board[x][y] == 1)
      {
        int squareX = (x * 200) + 100;
        int squareY = (y * 200) + 100;
        line(squareX + 50, squareY +50, squareX +150, squareY + 150);
        line(squareX + 150, squareY +50, squareX+50, squareY + 150);
      }

      if (board[x][y] == 2) {
        int squareX = (x * 200) + 200;
        int squareY = (y * 200) + 200;
        noFill();
        ellipse(squareX, squareY, 100, 100);
      }
    }
  }
  if (winner != 0) {
    fill(#FF559C);
    textSize(250);
    textAlign(CENTER, CENTER);
    if (winner == 1) {
      text("X won!!", width/2, height/2);
      if (scored == false) {
        scoreX ++;
        scored = true;
      }
    } else if (winner == 2) {
      text("O won!!", width/2, height/2);
      if (scored == false) {
        score0 ++;
        scored = true;
      }
    } else if (winner == -1)
      text("Draw", width/2, height/2);

    if (time == 0) {
      time = System.currentTimeMillis();
    }


    if (System.currentTimeMillis() - time > 3000) {
      scored = false;
      winner = 0;
      turn = 1;
      time = 0;
      for (int x = 0; x < 3; x ++) {
        for (int y = 0; y < 3; y ++) {
          board[x][y] = 0;
        }
      }
    }
  }
}
void mouseClicked() {
  int row = 0;
  int col= 0;
  if (mouseX < 300)
    col = 0;
  else if (mouseX > 500)
    col = 2;
  else
    col = 1;

  if (mouseY < 300)
    row = 0;
  else if (mouseY > 500)
    row = 2;
  else
    row = 1;


  if (board[col][row] == 0) {
    board[col][row] = turn;

    if (turn == 1) {
      turn = 2;
    } else if (turn ==2) {
      turn =1;
    }
  }


  winner = checkwinner();
}

int checkwinner() {
  int winner = 0;
  if (board [0][0] != 0 && board[0][0] == board[1][1] && board[0][0] == board[2][2])
    winner = board[0][0];
  if (board [0][2] != 0 && board [1][1] == board[0][2] && board[1][1] == board[2][0])
    winner = board[1][1];

  for (int i = 0; i < 3; i ++) {
    if (board[i][0] != 0 && board[i][1] == board[i][0] && board[i][1] == board[i][2])
      winner = board[i][2];

    if (board[0][i] != 0 && board[1][i] == board[0][i] && board[1][i] == board[2][i])
      winner = board[2][i];
  }

  if (winner ==0) {
    for (int i = 0; i < 3; i ++) {

      for (int j = 0; j < 3; j ++) {

        if (board[i][j] == 0)
          return winner;
      }
    }
    return -1;
  }


  return winner;
}
