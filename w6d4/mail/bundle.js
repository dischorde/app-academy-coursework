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

	const Router = __webpack_require__(1);
	const Inbox = __webpack_require__(2);

	const Routes = function() {
	  this.inbox = new Inbox;
	};

	document.addEventListener("DOMContentLoaded", function(event) {
	   let lis = document.querySelectorAll('.sidebar-nav li');
	   for (let i = 0; i < lis.length; i++) {
	     let li = lis[i];

	     li.addEventListener('click', (e) => {
	       let location = li.innerText.toLowerCase();
	       window.location.hash = location;
	     });

	     let content = document.querySelector('.content');
	     let routes = new Routes();
	     let router = new Router(content, routes);
	     router.start();
	   }
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router{
	  constructor (node, routes) {
	    this.node = node;
	    this.routes = routes;
	  }


	  start () {
	    this.render();
	    window.addEventListener("hashchange", (e) => this.render());
	  }

	  activeRoute () {
	    let compName = window.location.hash.slice(1);
	    return this.routes[compName];
	  }

	  render () {
	    let component = this.activeRoute();
	    if (component === undefined) {
	      this.node.innerHTML = "";
	    }
	    else {
	      this.node.innerHTML = "";
	      this.node.appendChild(component.render());
	    }
	  }
	}

	module.exports = Router;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class Inbox {
	  constructor () {

	  }

	  render () {
	    let ul = document.createElement("ul");
	    ul.className = "messages";
	    ul.innerHTML = "An Inbox Message";
	    return ul;
	  }
	}




	module.exports = Inbox;


/***/ }
/******/ ]);