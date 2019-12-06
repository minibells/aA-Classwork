let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = [];
  for (let i = 0; i < 8; i++) {
    grid.push(new Array(8));
  }
  
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x = pos[0];
  let y = pos[1];
  // console.log(pos); 
  if (!this.isValidPos(pos)) {
    throw new Error("Invalid Move");
  }
    return this.grid[x][y];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos); 
  if (!piece) {
    return false;
  }

  return piece.color === color; 
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let piece = this.getPiece(pos);
  return piece !== undefined;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let col = pos[0];
  let row = pos[1];

  if ((col > 7 || row > 7) || (col < 0 || row < 0)) {
    return false;
  }

 return true;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip = []) {
  let [x, y] = pos;
  let [dX, dY] = dir;
  let nextMove = [x + dX, y + dY];
  
  if (!board.isValidPos(nextMove)) {return null;} 
  if (!board.isOccupied(nextMove)) {return null;}

  if (board.isMine(nextMove, color)){
    return piecesToFlip.length === 0 ? null : piecesToFlip;
  } 
  
  piecesToFlip.push(nextMove);
  return  _positionsToFlip(board, nextMove, color, dir, piecesToFlip);

}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {

};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {

  for (let i = 0; i < Board.DIRS.length; i++) {
    let dir = Board.DIRS[i];
    let flippable = _positionsToFlip(this, pos, color, dir);
    // console.log(flippable);
    if (flippable !== null) return true;
  }
  return false;
};


/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let valid = [];
  // console.log(this.validMove([2, 3], "black"));

  for (let i = 0; i < this.grid.length; i++) {
    // let row = this.grid[i];
    for (let j = 0; j < this.grid.length; j++) {
      let pos = [i, j];

      if (this.validMove(pos, color)) {
        valid.push(pos);
      }
      
      // console.log(pos);
      // console.log("----");
      // console.log(this.validMove(pos, color));
      // if (this.validMove(pos, color)) {
      //   valid.push(pos);
      // }
    }
  }

  return valid;
};


module.exports = Board;
