function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// works but changes the value of x in the block because of 'var'
// => in block, in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// two different constants from two different scopes?
// => in block, out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// 'x' was already declared as a constant
// => SyntaxError


function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// temporarily sets 'x' in the block and out fo it
// => in block, out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again'; //problem
  console.log(x);
}
// 'x' was already declared through let
// => SyntaxError

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  var nums = [];
  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      nums.push(el);
    }
  });
  return nums;
}

function isPrime(num) {
  if (num < 2) { return false };
  for (var factor = 2; factor < num; factor++) {
    if (num % factor === 0) {
      return false;
    }
  }
  return true;
}

function sumOfPrimes(num) {
  let sum = 0;
  for (var i = 2; i < num; i++) {
    if (isPrime(i)) {
      sum += i;
    }
  }
  return sum;
}

//  not sure why this doesn't work

// function sumOfNPrimes (n) {
//   let sum = 0;
//   let countPrimes = 0;
//   let i = 2;
//
//   while (countPrimes < n) {
//     if (isPrime(i)) {
//       sum += i;
//       countPrimes++;
//     }
//     i++;
//   }
//
//   return sum;
// }
