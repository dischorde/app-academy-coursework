const DOMNodeCollection = require('./dom_node_collection.js');

function $1(argument) {
  if (argument instanceof HTMLElement) {
    return new DOMNodeCollection([argument]);
  }
  else {
    let nodes = document.querySelectorAll(argument);
    return new DOMNodeCollection(Array.from(nodes));
  }
}

window.$1 = $1;
