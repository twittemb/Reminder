//: [Previous](@previous)

import Foundation

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
