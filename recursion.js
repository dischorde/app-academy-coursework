function myRange(start, finish){
  if (start === finish){
    return [start];
  }

  return [start].concat(myRange(start + 1, finish));

}
// console.log(myRange(1,5));

Array.prototype.mySum = function() {
  if (this.length === 1){
    return this[0];
  }
    return this[0] + this.slice(1).mySum();
};

// console.log([1,2,3,4,5].mySum());



function myExp(base, pwr) {
  if (pwr === 0) {
    return 1;
  }

  return base * myExp(base, pwr - 1);
}

// console.log(myExp(3, 3));

function fibonacci(n) {
  if (n < 2) {
    return [n];
  }
  if (n === 2) {
    return [1, 1];
  }

  let prev = fibonacci(n - 1);
  let next = prev[prev.length - 2] + prev[prev.length - 1];
  return prev.concat([next]);
}

// console.log(fibonacci(6));

Array.prototype.bSearch = function(target) {
  if (this.length < 1) {
    return null;
  }

  let middle = Math.floor(this.length / 2);

  if (this[middle] === target) {
    return middle;
  }
  else if (target < this[middle]) {
    return this.slice(0, middle).bSearch(target);
  }
  else {
    let res = this.slice(middle + 1, this.length).bSearch(target);
    return (res !== null ? middle + 1 + res : null);
  }

};

// console.log([1, 2, 3].bSearch(1));
// console.log([2, 3, 4, 5].bSearch(3));
// console.log([2, 4, 6, 8, 10].bSearch(6));
// console.log([1, 3, 4, 5, 9].bSearch(5));
// console.log([1, 2, 3, 4, 5, 6].bSearch(6));
// console.log([1, 2, 3, 4, 5, 6].bSearch(0));
// console.log([1, 2, 3, 4, 5, 7].bSearch(6));

function makeChange(amt, coins) {
  if (amt === 0 ) {
    return [];
  }
  if (coins.length === 0) {
    return null;
  }
  // return amout if the amount is the same as a coin value
  if (coins.includes(amt)) {
    return [amt];
  }
  // best coin is the biggest coin that is less than the amount
  let bestCoin = 0;
  coins.forEach((coin) => {
    if (coin > bestCoin && coin < amt) {
      bestCoin = coin;
    }
  });
  // if none of the coins are less than the amt return null
  if (bestCoin === 0) {
    return null;
  }
  let remaining = amt - bestCoin;
  return [bestCoin].concat(makeChange(remaining, coins));
}

// console.log(makeChange(14, [10, 7, 1]));


Array.prototype.mySelect = function(cb) {
  let selected = [];

  this.forEach((el) => {
    if (cb(el) === true) {
      selected.push(el);
    }
  });

  return selected;
};

// console.log([1,2,3,4,5].mySelect((el) => el % 2 === 0));

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


function makeBetterChange(amt, coins) {
  if (amt === 0 ) {
    return [];
  }
  if (coins.length === 0) {
    return null;
  }
  if (coins.includes(amt)) {
    return [amt];
  }

  let bestAnswer = null;
  let validCoins = coins.mySelect((coin) => coin < amt);

  // go through each coin
   for (let i = 0; i < validCoins.length; i++) {
    let coin = validCoins[i];

    // othercoins = find the make better change for the remaining amount
    let otherCoins = makeBetterChange((amt - coin), coins);
    // next if othercoins is null
    if (otherCoins === null) {
      continue;
    }

    // potential answer is current coin + othercoins
    let potentialAnswer = [coin].concat(otherCoins);

    // save it to best answer if it is smaller in num coins than best answer
    if (bestAnswer === null || bestAnswer.length > potentialAnswer.length) {
      bestAnswer = potentialAnswer;
    }
  }

  // return best answer
  return bestAnswer;
}

// console.log(makeBetterChange(14, [10, 7, 1]));





Array.prototype.mergeSort = function(cb) {
if (this.length === 1) {
  return this;
}

let middle = Math.floor(this.length / 2);
let left = this.slice(0, middle).mergeSort(cb);
let right = this.slice(middle, this.length).mergeSort(cb);

// the sorted halves
  return merge(left, right, cb);
};

function merge(arr1, arr2, cb) {
  let merged = [];
  while(arr1.length > 0 && arr2.length > 0) {
    switch (cb(arr1[0], arr2[0])){
      case -1:
        merged.push(arr1.shift());
        break;
      case 1:
        merged.push(arr2.shift());
        break;
      default:
        merged.push(arr1.shift());
        break;
    }
  }
  let both = arr1.concat(arr2);
  return merged.concat(both);
}

console.log([3,4,7,88,42,122,56,9,63].mergeSort((el1, el2) => {
  if (el1 < el2) {
    return -1;
  }
 else if (el1 > el2){
   return 1;
 }
 else {
   return 0;
 }
}));














//
