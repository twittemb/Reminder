//: [Previous](@previous)

import Foundation
import RxSwift

/// First: every kind of extension, just to make a reminder

///////////////////
/// Basic extension
///////////////////

print ("------------------ Basic extension ------------------")

extension String {
    func numberOf (letter: Character) -> Int {
        return self.filter { $0 == letter }.count
    }

    static func build (withNumberOfSpaces spaces: Int) -> String {
        return [Int](1...spaces).reduce("", { (previous, _) -> String in
            return previous + " "
        })
    }
}

let blog = "twittemb.github.io"
let emptySpaces = String.build(withNumberOfSpaces: 10)

print ("Number of letters: \(blog.numberOf(letter: "t"))")
print ("Built String: |\(emptySpaces)|")

print ("")

/////////////////////////
/// Conditional extension
/////////////////////////

print ("------------------ Conditional extension ------------------")

extension Array where Element: Numeric {
    func sum () -> Element {
        return self.reduce (0, +)
    }
}

let numerics = [1, 2, 3, 4, 5.5]
print ("Sum of elements in \(numerics): \(numerics.sum())")

extension Optional where Wrapped == Int {
    var evenOptional: Optional<Bool> {
        return self.map { $0 % 2 == 0 }
    }
}

let optionalInteger: Int? = 3
print ("Integer \(optionalInteger) is even ? \(optionalInteger.evenOptional)")

print ("")

////////////////////////
/// Protocol Conformance
////////////////////////

print ("------------------ Protocol conformance ------------------")

protocol Resettable {
    func reset () -> Self
}

extension String: Resettable {
    func reset() -> String {
        return ""
    }
}

extension Int: Resettable {
    func reset() -> Int {
        return 0
    }
}

extension Optional: Resettable {
    func reset() -> Optional<Wrapped> {
        return nil
    }
}

let name = "Spock"
let age = 120
let isVulcan: Bool? = true

let resettables: [Resettable] = ["Spock", 120 , isVulcan]
print ("Array before reset: \(resettables)")

let reset = resettables.map { $0.reset() }
print ("Array after reset: \(reset)")

print ("")

//////////////////////////////////////////////////////////////////////////
/// Conditional Conformance = Protocol Conformance + Conditional Extension
//////////////////////////////////////////////////////////////////////////

print ("------------------ Conditional conformance ------------------")

/// a first usage: make a superset conform to the same protocol as its elements (another kind of recursion)
print ("--- first usage: make everyone conform to Resettable")

extension Array: Resettable where Element == Resettable {
    func reset() -> Array<Element> {
        return self.map { $0.reset() }
    }
}

let innerResettableArray: [Resettable] = ["Spock", 120]
let resettableArray: [Resettable] = ["Kirk", 45, Optional<Bool>(true), innerResettableArray]
print ("Array before reset: \(resettableArray)")
print ("Array after reset: \(resettableArray.reset())")

print ("")

/// a second usage: Ease the use of a design pattern such as Visitor
print ("--- second usage: Ease the use of a design pattern such as Visitor")

protocol Visitor {
    func visit (visitable: Visitable)
}

protocol Visitable {
    func accept (visitor: Visitor)
}

struct Person {
    let name: String
    let age: Int
}

struct Car {
    let isElectric: Bool
    let model: String
    let price: Double
}

extension Person: Visitable {
    func accept (visitor: Visitor) {
        if self.age > 30 {
            visitor.visit(visitable: self)
        }
    }
}

extension Car: Visitable {
    func accept (visitor: Visitor) {
        if self.isElectric {
            visitor.visit(visitable: self)
        }
    }
}

extension Array: Visitable where Element == Visitable {
    func accept (visitor: Visitor) {
        self.forEach { $0.accept(visitor: visitor) }
    }
}

extension Dictionary: Visitable where Value == Visitable {
    func accept (visitor: Visitor) {
        self.values.forEach { $0.accept(visitor: visitor) }
    }
}

class AnyVisitor: Visitor {
    func visit (visitable: Visitable) {
        switch visitable {
        case let person as Person:
            print ("\(person.name) is \(person.age) years old")
        case let car as Car:
            print ("\(car.model)'s price is \(car.price)$")
        default:
            print (visitable)
        }
    }
}

let ironman = Person(name: "Tony Stark", age: 45)
let hulk = Person(name: "Bruce Banner", age: 40)
let captain = Person(name: "Steve Rogers", age: 29)
let spiderman = Person(name: "Peter Parker", age: 16)

let tesla = Car(isElectric: true, model: "Roadster", price: 120000)
let porsche = Car(isElectric: false, model: "911", price: 250000)
let ferrari = Car(isElectric: false, model: "GTO", price: 1000000)
let nissan = Car(isElectric: true, model: "Leaf", price: 30000)

let arrayToVisit: [Visitable] = [ironman, spiderman, tesla, porsche]
let dictionnaryToVisit: [String: Visitable] = ["key1": hulk, "key2": captain, "key3": ferrari, "key4": nissan, "key5": arrayToVisit]

let anyVisitor = AnyVisitor()
dictionnaryToVisit.accept(visitor: anyVisitor)

//: [Next](@next)
