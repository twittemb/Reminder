//: [Previous](@previous)

import Foundation

func climStairs (nbStairs: Int) -> Int {
    if nbStairs == 0 {
        return 0
    }

    if nbStairs == 1 {
        return 1
    }

    if nbStairs == 2 {
        return 2
    }

    if nbStairs == 3 {
        return 4
    }

    return climStairs(nbStairs: nbStairs-1) + climStairs(nbStairs: nbStairs-2) + climStairs(nbStairs: nbStairs-3)
}

print (climStairs(nbStairs: 10))

func Hanoi (nbDisks: Int, from: Int, to: Int) {
    guard nbDisks > 0 else { return }
    Hanoi(nbDisks: nbDisks-1, from: from, to: 3-(from+to))
    print ("Move 1 disque from \(from) to \(to)")
    Hanoi(nbDisks: nbDisks-1, from: 3-(from+to), to: to)
}

Hanoi (nbDisks: 4, from: 0, to: 2)

//: [Next](@next)
