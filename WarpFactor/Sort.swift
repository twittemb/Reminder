//
//  Sort.swift
//  WarpFactor
//
//  Created by Thibault Wittemberg on 18-04-30.
//  Copyright © 2018 WarpFactor. All rights reserved.
//

import Foundation


func makeChangeRecursif (target: Int, coins: [Int]) -> [[Int]] {

    if target < 0 {
        return [[Int]]()
    }

    for i in 0..<coins.count {
        let coin = coins[i]
        let rest = target - coin

        print ("coins=\(coins) target=\(target) coin=\(coin) rest=\(rest)")

        if rest < 0 {
            let result = [[Int]]()
            return result
        }

        if rest == 0 {
            var result = [[Int]]()
            result.append([coin])
            return result
        }

        if rest - coin >= coin {
            var result = [[Int]]()
            result.append([coin])
            return result + makeChangeRecursif(target: rest, coins: coins)
        } else {
            var result = [[Int]]()
            result.append([coin])
            return result + makeChangeRecursif(target: rest, coins: Array(coins[1...]))
        }
    }

    return [[Int]]()

}
