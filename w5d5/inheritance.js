Function.prototype.inherits = function(Parent) {
  function Surrogate() {}
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject() {}

MovingObject.prototype.move = function() {
  console.log("whooooooooooossh");
};

function Ship(name) {
  this.name = name;
}
Ship.inherits(MovingObject);


function Asteroid(size) {
  this.size = size;
}
Asteroid.inherits(MovingObject);




let moon = new MovingObject();

let ship = new Ship("The USS Enterprise");

let asteroid = new Asteroid("super duper big");

console.log(ship.name);

console.log(asteroid.size);
console.log(ship.size);
moon.move();
ship.move();
asteroid.move();
