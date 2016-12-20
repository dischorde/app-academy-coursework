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

	const HanoiGame = __webpack_require__(1);
	const HanoiView = __webpack_require__(2);


	$( () => {
	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  let view = new HanoiView(game, rootEl);
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx)
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class View {
	  constructor(game, $figure) {
	    this.game = game;
	    this.figure = $figure;
	    this.setupTowers();
	    this.setListeners();
	    this.fromPile = null;
	    this.toPile = null;
	  }

	  setupTowers () {
	    let $first = $("<ul id='first'>").data('value', 0);
	    for (let i = 0; i < 3; i++) {
	      console.log(i);
	      let $li = $("<li>");
	      let size = this.game.towers[0][i];
	      $($li).data('val', size);
	      $($li).css('width', `${(size) * 30}%`);
	      $first.append($li);
	    }

	    this.figure.append($first);

	    let $second = $("<ul id='second'></ul>").data('value', 1);
	    this.figure.append($second);

	    let $third = $("<ul id='third'></ul>").data('value', 2);
	    this.figure.append($third);
	  }

	  render() {
	    if (this.toPile !== null) {
	      if (this.game.move(this.fromPile.data('value'), this.toPile.data('value')) === true) {
	        console.log(this.fromPile.data('value'));
	        let $currListItem = $(':last-child', this.fromPile).detach();
	        this.toPile.append($currListItem);
	      }
	      this.fromPile = null;
	      this.toPile = null;
	    }
	  }

	  setListeners() {
	    $('ul').on('click', (event) => {
	      if (this.fromPile === null) {
	        this.fromPile = $(event.currentTarget);
	      } else {
	        this.toPile = $(event.currentTarget);
	      }
	      this.render();
	      if (this.game.isWon()) {
	        setTimeout(() => {
	          alert("You Won!!!!");
	        }, 500 );
	      }
	    });
	  }
	}

	module.exports = View;


/***/ }
/******/ ]);