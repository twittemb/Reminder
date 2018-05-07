//
//  Sort.swift
//  WarpFactor
//
//  Created by Thibault Wittemberg on 18-04-30.
//  Copyright © 2018 WarpFactor. All rights reserved.
//

import Foundation


func makeChangeRecursif (target: Int, coins: [Int], currentStackOfCoins: [Int] = [Int]()) -> Int {

    if target < 0 {
        return 0
    }

    var solutions = 0

    for i in 0..<coins.count {

        let coin = coins[i]

        let rest = target - coin

        if rest < 0 {
            continue
        }

        if rest == 0 {
            solutions += 1
            print ("1 Solution -> \(currentStackOfCoins+[coin])")
            continue
        }

        if rest - coin >= 0 {
            solutions += makeChangeRecursif(target: rest, coins: Array(coins[i...]), currentStackOfCoins: currentStackOfCoins+[coin])
        } else {
            solutions += makeChangeRecursif(target: rest, coins: Array(coins[1...]), currentStackOfCoins: currentStackOfCoins+[coin])
        }
    }

    return solutions

}
