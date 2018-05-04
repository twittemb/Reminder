//: [Previous](@previous)

import Foundation

/// Optional can be mapped and flatmapped. This only difference is that flatMap can return nil as the return type is an optional (that will
/// be flatten in the source Optional)
/// map and flatMap on nil value will return nil as well
let optionalInt1: Int? = nil
let optionalInt2: Int? = 6
let optionalInt3: Int? = 2
let optionalInt4: Int? = 8

let unwrapped1 = optionalInt1.map { $0 }
let unwrapped2 = optionalInt2.map { $0 }
let unwrapped3 = optionalInt3.flatMap{ _ -> String? in return nil }
let unwrapped4 = optionalInt4.flatMap{ $0 }

print (unwrapped1)
print (unwrapped2)
print (unwrapped3)
print (unwrapped4)

/// compactMap on sequence, removes the nil values

let array1 = [1, 2, 3, nil, 5]
let array1WithoutNil1 = array1.map { $0 }
let array1WithoutNil2 = array1.compactMap { $0 }.map { $0 * $0 }

print (array1WithoutNil1)
print (array1WithoutNil2)

let array2 = [[1, 2, 3], [4, 5], nil, [6, 7, 8]]
let array2WithoutNil1 = array2.map { $0 }
let array2WithoutNil2 = array2.compactMap { $0 }
let array2WithoutNil3 = array2.compactMap { $0 }.flatMap { $0 }

print (array2WithoutNil1)
print (array2WithoutNil2)
print (array2WithoutNil3)

//: [Next](@next)
