import Foundation

let myAge = 20;
let yourAge = 16;

if myAge > yourAge {
    "I'm older than you"; //dont need to print the log
} else if myAge < yourAge {
    "i'm younger than you";
} else {
    "Oh hey, we're the same age!";
}

let doubleMyAge = myAge * 2;

/// 1. unary prefix
let foo = !true;

/// 2. unary postfix
let name = Optional("vandad");
type(of: name)
let unaryPostFix = name!; // optional -> satisfies the variable (like typescrit)
type(of: unaryPostFix)

/// 3. binary infix
let result = 1 + 2;


// ternary operator
let age = 30
let message: String = age > 18 ? "you can vote" : "you cannot vote";
