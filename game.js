
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game {
  constructor (numOfDiscs) {
    this.towers = [[],[],[]];

    for (let i = numOfDiscs; i > 0; i--) {
      this.towers[0].push(i);
    }
  }

  promptMove (callBack) {
    this.print();
    reader.question("Where do you want to move a disc from: ", (startTower) => {
      reader.question("Where do you want to move a disc to: ", (endTower) => {
        startTower = parseInt(startTower) - 1;
        endTower = parseInt(endTower) - 1;
        callBack(startTower, endTower);
      });
    });
  }

  isValidMove(start, end) {
    let startTower = this.towers[start];
    let endTower = this.towers[end];
    if (startTower.length === 0) {
      return false;
    }
    else if (startTower[startTower.length - 1] > endTower[endTower.length - 1]) {
      return false;
    }
    else {
      return true;
    }
  }

  move(start, end) {
    if (this.isValidMove(start, end)) {
      this.towers[end].push(this.towers[start].pop());
      return true;
    }
    return false;
  }

  print () {
    console.log(`First Tower: ${this.towers[0]}`);
    console.log(`Second Tower: ${this.towers[1]}`);
    console.log(`Third Tower: ${this.towers[2]}`);
  }

  isWon() {
    return ((this.towers[0].length === 0 && this.towers[1].length === 0 ) ||
        (this.towers[0].length === 0 && this.towers[2].length === 0 ));
  }

  run(completionCallback) {
    if (this.isWon()) {
      reader.close();
      completionCallback();
    }
    else {
      this.promptMove((start, end) => {
        let result = this.move(start, end);
        if (!result) {
          console.log("I am an error message.");
        }
        this.run(completionCallback);
      });
    }
  }
}

module.exports = Game;

// let game = new Game(3);
// game.run(() => console.log("testing"));
