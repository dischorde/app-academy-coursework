/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(1);
	const MovingObject = __webpack_require__(2);
	const Asteroid = __webpack_require__(3);
	const Game = __webpack_require__(4);
	const GameView = __webpack_require__(5);

	document.addEventListener("DOMContentLoaded", function () {
	  let canvas = document.getElementById("game-canvas");
	  let ctx = canvas.getContext("2d");
	  let game = new Game();
	  let view = new GameView(game, ctx);
	  view.start();
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	const Util = {
	  inherits (childClass, parentClass) {
	    function Surrogate() {}
	    Surrogate.prototype = parentClass.prototype;
	    childClass.prototype = new Surrogate;
	    childClass.prototype.constructor = childClass;
	  },
	  // Return a randomly oriented vector with the given length.
	  randomVec (length) {
	    const deg = 2 * Math.PI * Math.random();
	    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
	  },
	  // Scale the length of a vector by the given amount.
	  scale (vec, m) {
	    return [vec[0] * m, vec[1] * m];
	  }
	};


	window.Util = Util;
	module.exports = Util;


/***/ },
/* 2 */
/***/ function(module, exports) {

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


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(1);
	const MovingObject = __webpack_require__(2);

	function Asteroid(position, game) {
	  this.COLOR = "#42f4ad";
	  this.RADIUS = 25;
	  MovingObject.call(this, { pos: position, game: game, color: this.COLOR, radius: this.RADIUS, vel: Util.randomVec(4) });

	}

	Util.inherits(Asteroid, MovingObject);

	window.Asteroid = Asteroid;
	module.exports = Asteroid;


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(1);
	const MovingObject = __webpack_require__(2);
	const Asteroid = __webpack_require__(3);

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


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(1);
	const MovingObject = __webpack_require__(2);
	const Asteroid = __webpack_require__(3);
	const Game = __webpack_require__(4);


	function GameView(game, ctx) {
	  this.game = game;
	  this.ctx = ctx;
	}

	GameView.prototype.start = function () {
	  let that = this;
	  setInterval(function () {
	    that.game.step();
	    that.game.draw(that.ctx);
	  }, 20);
	};

	module.exports = GameView;


/***/ }
/******/ ]);