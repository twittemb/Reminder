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

func fibonacciRecursif (n: Int) -> Int {

    if n <= 0 {
        return 1
    }

    if n == 1 {
        return 1
    }

    return fibonacciRecursif(n: n-2) + fibonacciRecursif(n: n-1)
}

print ("fibonacciRecursif: \(fibonacciRecursif(n: 10))")

func fibonacciDynamic (n: Int) -> CLong {
    var results = [CLong](0...n)

    results[0] = 1
    results[1] = 1

    for i in 2...n {
        results[i] = results[i-2] + results[i-1]
    }

    return results[n]
}

print ("fibonacciDynamic: \(fibonacciDynamic(n: 91))")

func makeChangeRecursif (target: Int, coins: [Int], currentStackOfCoins: [Int] = [Int]()) -> Int {

    var solutions = 0

    for i in 0..<coins.count {

        let rest = target - coins[i]

//        print ("coins=\(coins) target=\(target) coin=\(coin) rest=\(rest)")

        if target > 0 && rest < 0 {
            continue
        }

        if rest == 0 {
            solutions += 1
            print ("1 Solution -> \(currentStackOfCoins+[coins[i]])")
            continue
        }

        if rest >= target {
            solutions += makeChangeRecursif(target: rest, coins: Array(coins[(i+1)...]), currentStackOfCoins: currentStackOfCoins+[coins[i]])
        } else {
            solutions += makeChangeRecursif(target: rest, coins: Array(coins[i...]), currentStackOfCoins: currentStackOfCoins+[coins[i]])
        }
    }

    return solutions

}
print(makeChangeRecursif(target: 15, coins: [-10, 9, 4, -3, 2, 6, 8]))

func countChangeDynamic (value: Int, coins: [Int]) -> Int {
    var ways = [Int](0...value)
    for i in 1..<ways.count {
        ways[i] = 0
    }

    ways[0] = 1
//    print (ways)

    coins.forEach { (coin) in
        for i in coin...value {
            ways[i] += ways[i-coin]
//            print (ways)
        }
    }

    return ways[value]
}

print (countChangeDynamic(value: 10, coins: [1, 2, 4].sorted()))

//: [Next](@next)
