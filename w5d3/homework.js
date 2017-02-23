function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}

console.log(madLib('make', 'best', 'guac'));


function isSubstring(searchstring, subString) {

  if(searchstring.includes(subString)) {
    return true;
  }
  return false;
}

console.log(isSubstring("time to program", "time"));

console.log(isSubstring("Jump for joy", "joys"));


function fizzBuzz(array){
  var new_arr = [];
  array.forEach(number => {
    if ((number % 3 === 0 || number % 5 === 0) && (number % 15 != 0))
    new_arr.push(number);
  });
  return  new_arr;
}

let array = [1,3,5,15,9];

console.log(fizzBuzz(array));


function isPrime(number){
  var i;
  for (i = 2; i < number; i++){
    if (number % i === 0){
      return false;
    }
  }
  return  true;
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));

function sumOfNPrimes(number){
  var sum = 0;
  var count = 0;
  var i = 2;
  while (count < number) {
    if (isPrime(i)){
      sum += i;
      count += 1;
    }
    i += 1;
  }
  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));


function titleize(names, callback){
  let titlized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);

  callback(titlized);
}
titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});

function Elephant(name, height, tricks){
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  let str = `${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!''`;
  console.log(str);
};
Elephant.prototype.grow = function () {
  let str = `${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!''`;
  console.log(str);
};
