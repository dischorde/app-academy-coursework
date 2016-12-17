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
    this.asteroids.push(new Asteroid(randPos, this));
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

Game.prototype.wrap = function(pos) {
  let [x, y] = pos;
  if (x < 0) {
    x += this.DIM_X;
  }
  else if (x > this.DIM_X) {
    x -= this.DIM_X;
  }
  if (y < 0) {
    y += this.DIM_Y;
  }
  else if (y > this.DIM_Y) {
    y -= this.DIM_Y;
  }
  return [x, y];
};

Game.prototype.checkCollisions = function() {
  for(let i = 0; i < this.asteroids.length - 1; i++) {
    let current = this.asteroids[i];
    for(let j = i + 1; j < this.asteroids.length; j++ ) {
      let comparison = this.asteroids[j];
      if (current.isCollidedWith(comparison)) {
        this.remove(current);
        this.remove(comparison);
      }
    }
  }
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function(asteroid) {
  let idx = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(idx, 1);
};



window.Game = Game;
module.exports = Game;
