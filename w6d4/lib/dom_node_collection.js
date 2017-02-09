class DOMNodeCollection {
  constructor(els) {
    this.els = els;
  }

  html (string) {
    if (string === undefined) {
      return this.els[0].innerHTML;
    }
    else {
      for (let i = 0; i < this.els.length; i++) {
        this.els[i].innerHTML = string;
      }
    }
  }

  empty () {
    for (let i = 0; i < this.els.length; i++) {
      this.els[i].innerHTML = "";
    }
  }

  append (addition) {
    if (addition instanceof DOMNodeCollection) {
      for (let i = 0; i < addition.els.length; i++) {
        for (let j = 0; j < this.els.length; j++) {
          this.els[j].innerHTML += addition.els[i].outerHTML;
        }
      }
    }
    else {
      for (let k = 0; k < this.els.length; k++) {
        this.els[k].innerHTML += addition;
      }
    }
  }

  attr (attributeName, value) {
    if (value === undefined) {
      return this.els[0].getAttribute(attributeName);
    }
    else {
      for (let k = 0; k < this.els.length; k++) {
        this.els[k].setAttribute(attributeName, value);
      }
    }
  }

  addClass (className) {
    for (let k = 0; k < this.els.length; k++) {
      this.els[k].classList.add(className);
    }
  }

  removeClass (classes) {
    if (classes !== undefined) {
      classes = classes.split(" ");
    }

    for (let k = 0; k < this.els.length; k++) {
      if (classes === undefined) {
        this.els[k].className = "";
      }
      else {
        this.els[k].classList.remove(...classes);
      }
    }
  }

  children () {
    let kids = [];
    for (let k = 0; k < this.els.length; k++) {
      kids = kids.concat(Array.from(this.els[k].children));
    }
    return new DOMNodeCollection(kids);
  }

  parent () {
    let parents = [];
    for (let k = 0; k < this.els.length; k++) {
      let parent = this.els[k].parentNode;
      if (!(parents.includes(parent))){
        parents.push(parent);
      }
    }
    return new DOMNodeCollection(parents);
  }

  remove () {
    for (let k = 0; k < this.els.length; k++) {
      let parent = this.els[k].parentNode;
      parent.removeChild(this.els[k]);
    }
    this.els = [];
  }

  on (type, fn) {
    for (let k = 0; k < this.els.length; k++) {
      let el = this.els[k];
      el.addEventListener(type, fn);
      if (el.cbs === undefined) {
        el.cbs = {};
      }
      el.cbs[type] = fn;
    }
  }

  off (type) {
    for (let k = 0; k < this.els.length; k++) {
      let el = this.els[k];
      el.removeEventListener(type, el.cbs[type]);
    }
  }

}

module.exports = DOMNodeCollection;
