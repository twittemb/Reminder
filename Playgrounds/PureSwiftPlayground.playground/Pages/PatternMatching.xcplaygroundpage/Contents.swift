//: [Previous](@previous)

import Foundation

/// Pattern matching with Optionals (don't forget an optional is an enum that equals .some(x) or .none)
let optionalInt: Int? = 300
if case let .some(value) = optionalInt {
    print ("Unwrapped value is \(value)")
}

switch optionalInt {
case .some (0...200):
    print ("Inferieur a 200")
case .some(201...1000):
    print ("Entre 200 et 1000")
default:
    print ("Other")
}

let integer = 7

switch integer {
case 0...:
    print ("Entre 0 et l'infini")
default:
    print ("Autre")
}

struct Direction: OptionSet {
    let rawValue: Int

    static let north = Direction(rawValue: 1 << 0)
    static let south = Direction(rawValue: 1 << 1)
    static let east = Direction(rawValue: 1 << 2)
    static let west = Direction(rawValue: 1 << 3)

}

let options = [Direction.north, Direction.east]

switch options {
case [.north, .east]:
    print ("North East")
default:
    print ("Other")
}

let value1 = 222
let value2 = "McKoy"

switch (value1, value2) {
case (20, "McKoy"):
    print ("20 and McKoy")
case (let i as Int, let s as String) where i == 20:
    print ("\(i) and \(s) where i == 20")
case (let i as Int, let s as String) where s == "McKoy":
    print ("\(i) and \(s) where s == McKoy")
default:
    print ("Other")
}

enum Result {
    case ok(code: Int)
    case error(code: Int)
}

let result = Result.ok(code: 301)

switch result {
case .ok(200):
    print ("Result ok with 200")
case .ok(100..<200) :
    print ("Result ok with code >= 100 et < 200")
case .ok(200...):
    print ("Result ok with code > 200")
case .ok(let code) where code > 300:
    print ("Result ok with code > 300")
default:
    print ("Other result")
}

//: [Next](@next)
