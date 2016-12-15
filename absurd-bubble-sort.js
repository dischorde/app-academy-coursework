const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2}?`, (response) => {
      if (response === "yes") {
        callback(true);
      }
      else if (response === "no") {
        callback(false);
      }
  });
}

// askIfGreaterThan(3, 2, (resp) => console.log(`I'm the callback! ${resp}`));

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
  else if (i == (arr.length - 1)) {
      outerBubbleSortLoop(madeAnySwaps);
  }
}

// innerBubbleSortLoop([3,2,1,5], 0, false, () => console.log("in outer bubble sort"));


function absurdBubbleSort(arr, sortCompletionCallback) {

  let outerBubbleSortLoop = function(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }
    else if (madeAnySwaps === false) {
      sortCompletionCallback(arr);
    }
  };

  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
