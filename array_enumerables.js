function myEach(arr, aFunction) {
  for(let i = 0; i < arr.length; i++) {
    aFunction(arr[i]);
  }
  return arr;
}

// myEach([1,2,3,4], (num) => console.log(num * 2));


function myMap(arr, aNotherFunk){
  let mapped = [];
  myEach(arr, el => {
    let value = aNotherFunk(el);
    mapped.push(value);
  });
  return mapped;
}

function myMapForLoop(arr, aNotherFunk){
  let mapped = [];
  for(let i = 0; i < arr.length; i++) {
    mapped.push(aNotherFunk(arr[i]));
  }
  return mapped;
}

// console.log(myMap([1, 2, 3, 4], (num) => num + 1));

Array.prototype.myInject = function(cb) {
  let acc = this[0];
  myEach(this.slice(1), (el) => {
    acc = cb(acc, el);
  });
  return acc;
};

// console.log([1,2,3,4,5].myInject((acc, el) => acc + el ));

Array.prototype.mySelect = function(cb) {
  let selected = [];

  myEach(this, (el) => {
    if (cb(el) === true) {
      selected.push(el);
    }
  });

  return selected;
};

// console.log([1,2,3,4,5].mySelect((el) => el % 2 === 0));


Array.prototype.mySort = function(cb) {
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

console.log([1,2,3,4,5].mySort((el1, el2) => el1 < el2));
