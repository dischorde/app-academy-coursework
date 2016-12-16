const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

function Asteroid(position) {
  this.COLOR = "#42f4ad";
  this.RADIUS = 25;
  new MovingObject.call(this, { pos: position, color: this.COLOR, radius: this.RADIUS, vel: Util.randomVec(4) });

}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
