const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

function Asteroid(position, game) {
  this.COLOR = "#42f4ad";
  this.RADIUS = 25;
  MovingObject.call(this, { pos: position, game: game, color: this.COLOR, radius: this.RADIUS, vel: Util.randomVec(4) });

}

Util.inherits(Asteroid, MovingObject);

window.Asteroid = Asteroid;
module.exports = Asteroid;
