const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Give us a number:", (num) => {
      sum += parseInt(num);
      console.log(sum);
      addNumbers(sum, (numsLeft - 1), completionCallback);
    });
  }
  else if (numsLeft === 0) {
      completionCallback(sum);
      reader.close();
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
