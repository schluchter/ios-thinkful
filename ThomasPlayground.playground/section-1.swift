// Playground - noun: a place where people can play

import Cocoa

struct Number {
    var even = false
    var positive = false
    var prime = false
}

var number5 = Number (even: false, positive: true, prime: true)

var number7 = number5

number5
number7

number5.positive = false

number5
number7

class PersonInformation {
    var name: String
    var age: Int
    
    init (aName: String, anAge: Int) {
        self.name = aName
        self.age = anAge
    }
}

var me = PersonInformation(aName: "John", anAge: 40)

var you = me

me
you

me.name = "Sara"

me
you


number5.even == number7.even
number5.positive == number7.positive

you === me
