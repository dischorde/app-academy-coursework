function removeDuplicates(arr) {
  let dupFree = [];
  for (let i = 0; i < arr.length; i++) {
    if (!dupFree.includes(arr[i])) {
      dupFree.push(arr[i]);
    }
  }
  return dupFree;
}


// console.log(removeDuplicates([1, 2, 1, 3, 3]));


function twoSum(arr) {
  let output = [];

  for (let i = 0; i < arr.length - 1; i++) {
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[i] + arr[j] === 0) {
        output.push([i, j]);
      }
    }
  }

  return output;
}

// console.log(twoSum([-1, 0, 2, -2, 1]));

function myTranspose(arr) {
  let transposed = [];

  for (let col = 0; col < arr.length; col++) {
    let newRow = [];
    for (let row = 0; row < arr.length; row++) {
      newRow.push(arr[row][col]);
    }
    transposed.push(newRow);
  }
  return transposed;
}

// console.log(myTranspose(([
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8]
//   ])));
