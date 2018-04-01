//: [Previous](@previous)

import Foundation

/// Pattern matching with Optionals (don't forget an optional is an enum that equals .some(x) or .none)
let optionalInt: Int? = 3
if case let .some(value) = optionalInt {
    print ("Unwrapped value is \(value)")
}

//: [Next](@next)
