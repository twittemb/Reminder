//: [Previous](@previous)

import Foundation

public protocol Valuable {
    var value: Int { get }
}

protocol MutableValuable: Valuable {
    var value: Int { get set }
}

class ConcreteValuable: MutableValuable {
    internal(set) var value: Int

    init(with value: Int) {
        self.value = value
    }
}

let valuable = ConcreteValuable(with: 9)
valuable.value = 9


//: [Next](@next)
