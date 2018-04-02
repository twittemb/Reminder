//: [Previous](@previous)

import Foundation


/// Conditional conformance to help Optional and Array be Evenable if they wrap Integers
protocol Evenable {
    var isEven: Bool { get }
}

extension Optional: Evenable where Wrapped == Int {
    var isEven: Bool {
        return self.map({ (value) -> Bool in
            value % 2 == 0
        }) ?? false
    }
}

extension Array: Evenable where Element == Int {
    var isEven: Bool {
        return self.reduce(0) { (previous, current) -> Int in
            return previous + current
        } % 2 == 0
    }
}

let optionalInt: Int? = 5
let arrayOfInts = [1, 2, 3, 5, 5]

let evenables: [Evenable] = [optionalInt, arrayOfInts]
evenables.forEach { (element) in
    print ("The element is even ? \(element.isEven)")
}

/// Simply conform Array to a custom protocol that sums its content only if element are Int
protocol Summable {
    func sum () -> Int
}

extension Array: Summable where Element == Int {
    func sum() -> Int {
        return self.reduce(0, { (previous, current) -> Int in
            return previous + current
        })
    }
}

let arrayOfInt = [1, 2, 3, 4, 5]
print ("Array of Int is Summable with sum = \(arrayOfInt.sum())")

/// Simply conform Array to a custom protocol that sums its content only if element are Int
/// The protocol is generic so the sum result type will adapt according to the Element type of the array
protocol GenericSummable {
    associatedtype T
    func genericSum () -> T
}

extension Array: GenericSummable where Element == Double {
    typealias T = Double

    func genericSum() -> Double {
        return self.reduce(0, { (previous, current) -> Double in
            return previous + current
        })
    }
}

let arrayOfDouble = [1.1, 2.2, 3.3, 4.4, 5.5]
print ("Array of Double is Summable with sum = \(arrayOfDouble.genericSum())")

/// Completely custom

protocol SuperPower {
    var canFly: Bool { get }
    var canRun: Bool { get }
}

struct Flying: SuperPower {
    let canFly = true
    let canRun = false
}

struct Running: SuperPower {
    let canFly = false
    let canRun = true
}

struct Hero<SuperPowerType: SuperPower> {
    let power: SuperPower
}

protocol IronMan {
    var name: String { get }
}

extension IronMan {
    var name: String {
        return "Tony Stark"
    }
}

extension Hero: IronMan where SuperPowerType == Flying {
}

let tony = Hero<Flying>(power: Flying())
print ("My name, as a Flying Super Hero is \(tony.name)")


//: [Next](@next)
