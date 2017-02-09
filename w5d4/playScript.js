const Game = require("./game.js");
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
const callBack = () => {
  reader.question("Do you want to play again? ", (response) => {
    if (response === "yes") {
      // reader.close()
      game = new Game(3);
      game.run(reader, callBack);
    }
    else {
      reader.close();
    }
  });
};

let game = new Game(3);
game.run(reader,callBack);
