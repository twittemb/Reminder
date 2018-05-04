//: [Previous](@previous)

import Foundation

let inputArray = [Int](0...100).map { _ in Int(arc4random()) }

execute(name: "Stack", input: inputArray) { (input) -> [Int] in
    return stackSort(input: input)
}

execute(name: "Quick", input: inputArray) { (input) -> [Int] in
    return quickSort(input: input)
}

execute(name: "Tree", input: inputArray) { (input) -> [Int] in
    return treeSort(input: input)
}

func Hanoi (nbDisks: Int, from: Int, to: Int) {
    guard nbDisks > 0 else { return }
    Hanoi(nbDisks: nbDisks-1, from: from, to: 3-(from+to))
    print ("Move 1 disque from \(from) to \(to)")
    Hanoi(nbDisks: nbDisks-1, from: 3-(from+to), to: to)
}

Hanoi (nbDisks: 30, from: 0, to: 2)

//: [Next](@next)
