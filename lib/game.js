const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');

function Game() {
  this.DIM_X = 800;
  this.DIM_Y = 800;
  this.NUM_ASTEROIDS = 15;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for(let i = 0; i < this.NUM_ASTEROIDS; i++) {
    let randPos = this.randomPosition();
    this.asteroids.push(new Asteroid(randPos));
  }
};

Game.prototype.randomPosition = function() {
  let x = parseInt(Math.random() * this.DIM_X);
  let y = parseInt(Math.random() * this.DIM_Y);
  return [x, y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0, this.DIM_X, this.DIM_Y);
  this.asteroids.forEach( function(asteroid) {
    asteroid.draw(ctx);
  });
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach( function(asteroid) {
    asteroid.move();
  });
};

window.Game = Game;
module.exports = Game;
