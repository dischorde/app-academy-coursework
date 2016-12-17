const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');
const Game = require('./game.js');
const GameView = require('./game_view.js');

document.addEventListener("DOMContentLoaded", function () {
  let canvas = document.getElementById("game-canvas");
  let ctx = canvas.getContext("2d");
  let game = new Game();
  let view = new GameView(game, ctx);
  view.start();
});
