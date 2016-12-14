Array.prototype.bubbleSort = function(cb) {
  let sorted = false;
  while (sorted === false) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (cb(this[i], this[i + 1]) === true) {
        let temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};
