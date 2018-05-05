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

Hanoi (nbDisks: 3, from: 0, to: 2)

func makeChangeIteratif (value: Int, coins: [Int], reusableCoin: Bool = false) -> [Int]{
    let sortedCoins = Array(coins.sorted().reversed())

    var result = [Int]()
    var rest = value

    var coinsIndex = 0
    while coinsIndex < coins.count {

        print ("rest=\(rest) coinsIndex=\(coinsIndex) sortedCoins[coinsIndex]=\(sortedCoins[coinsIndex])")

        if (rest-sortedCoins[coinsIndex]) >= 0 {
            rest -= sortedCoins[coinsIndex]
            result.append(sortedCoins[coinsIndex])
            if !reusableCoin {
                coinsIndex += 1
            }
        } else {
            coinsIndex += 1
        }

    }

    if rest == 0 {
        return result
    }

    return [-1]
}

print (makeChangeIteratif(value: 20, coins: [5, 1], reusableCoin: true))

func makeChangeRecursif (value: Int, coins: [Int]) -> [Int] {

    if coins.count == 0 {
        if value != 0 {
            return [-1]
        }
        return [Int]()
    }

    let rest = value

    if (rest-coins[0]) == 0 {
        return [coins[0]]
    }

    if (rest-coins[0]) > 0 {
        return [coins[0]] + makeChangeRecursif(value: rest-coins[0], coins: coins)
    }

    if (rest-coins[0]) < 0 {
        return makeChangeRecursif(value: rest, coins: Array(coins.dropFirst()))
    }

    return [-1]
}

print (makeChangeRecursif(value: 20, coins: [1, 3, 2].sorted().reversed()))

//: [Next](@next)
