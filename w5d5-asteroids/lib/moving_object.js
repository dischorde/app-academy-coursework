function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {

};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};

MovingObject.prototype.move = function() {
  let newX = this.pos[0] + this.vel[0];
  let newY = this.pos[1] + this.vel[1];
  this.pos = this.game.wrap([newX, newY]);
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let [x1, y1] = this.pos;
  let [x2, y2] = otherObject.pos;
  let sum = this.radius + otherObject.radius;
  let distance = Math.sqrt(Math.pow((x1 - x2), 2) + Math.pow((y1 - y2), 2));
  if (distance < sum) {
    return true;
  }
  else {
    return false;
  }
};

window.MovingObject = MovingObject;
module.exports = MovingObject;
// Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
