//: [Previous](@previous)

import Foundation

func twoSum (set: [Int], target: Int) -> [[Int]] {

    var result = [[Int]]()
    for i in 0..<set.count {
        let value1 = set[i]

        for j in i+1..<set.count {
            let value2 = set[j]
            if (value1 + value2) == target {
                result.append([value1, value2])
            }
        }
    }

    return result
}

print (twoSum(set: [-1, 0, 3, 6, 1, -1, 9, 5, 3, 2, 1], target: 4))

func threeSum (set: [Int], target: Int) -> [[Int]] {
    var result = [[Int]]()
    for i in 0..<set.count {
        let value = set[i]
        var mutableSet = set.
        twoSum(set: mutableSet , target: target-value)
    }

    return result
}

//: [Next](@next)
