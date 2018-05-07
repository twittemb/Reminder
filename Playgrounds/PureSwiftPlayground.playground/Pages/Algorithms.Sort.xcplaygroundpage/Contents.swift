//: [Previous](@previous)

import Foundation

let inputArray = [Int](0...10).map { _ in Int(arc4random()) }

execute(name: "Stack", input: inputArray) { (input) -> [Int] in
    return stackSort(input: input)
}

execute(name: "Quick", input: inputArray) { (input) -> [Int] in
    return quickSort(input: input)
}

execute(name: "Tree", input: inputArray) { (input) -> [Int] in
    return treeSort(input: input)
}

//: [Next](@next)
