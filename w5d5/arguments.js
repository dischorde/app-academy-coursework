function sum(...args) {
  let argAr = args;
  let total = argAr.reduce((a, b) => {
    return a + b;
  });
  return total;

}
// console.log(sum(1,2,3,4));

Function.prototype.myBindArgs = function(thisThing) {
  let args = Array.from(arguments);
  args = args.slice(1);
  let fn = this;
  return function() {
    let callArgs = Array.from(arguments);
    fn.apply(thisThing, args.concat(callArgs));
  };
};

Function.prototype.myBind = function(thisThing, ...args) {
  return (...callArgs) => {
    this.apply(thisThing, args.concat(callArgs));
  };
};

function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((a, b) => {
        return a + b;
      });
    }
    else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}
// const sum2 = curriedSum(4);
// console.log(curriedSum(4)(3)(1)(2)(4));

Function.prototype.curry = function(numArgs) {
  let originalFunc = this;
  let args = [];

  function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return originalFunc.apply(this, args);
    }
    else {
      return _curry;
    }
  }
  return _curry;
};

// Function.prototype.curry = function(numArgs) {
//   let originalFunc = this;
//   let args = [];
//
//   function _curry(arg) {
//     args.push(arg);
//     if (args.length === numArgs) {
//       return originalFunc(...args);
//     }
//     else {
//       return _curry;
//     }
//   }
//   return _curry;
// };


console.log(sum.curry(3)(1)(1)(3));



// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
// markov.says("meow", "Ned");
// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast)("meow", "a tree");
// markov.says.myBind(breakfast, "meow")("Markov");
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
