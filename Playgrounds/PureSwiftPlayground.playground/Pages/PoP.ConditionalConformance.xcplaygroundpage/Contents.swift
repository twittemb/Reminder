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

// a first usage: make a superset conform to the same protocol as its elements (another kind of recursion)
extension Array: Resettable where Element == Resettable {
    func reset() -> Array<Element> {
        return self.map { $0.reset() }
    }
}

let innerResettableArray: [Resettable] = ["Spock", 120]
let resettableArray: [Resettable] = ["Kirk", 45, Optional<Bool>(true), innerResettableArray]
print ("Array before reset: \(resettableArray)")
print ("Array after reset: \(resettableArray.reset())")


/// Simply conform Array to a custom protocol that sums its content only if element are Int
/// The protocol is generic so the sum result type will adapt according to the Element type of the array
protocol GenericSummable {
    associatedtype T
    func genericSum () -> T
}

extension Array: GenericSummable where Element: Numeric {
    typealias T = Element

    func genericSum() -> Element {
        return self.reduce(0, +)
    }
}

let arrayOfDouble = [1.1, 2.2, 3.3, 4.4, 5.5]
print ("Array of Double is Summable with sum = \(arrayOfDouble.genericSum())")

//: [Next](@next)
