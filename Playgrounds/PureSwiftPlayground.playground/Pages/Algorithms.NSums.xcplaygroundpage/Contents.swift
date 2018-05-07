//: [Previous](@previous)

import Foundation

func twoSum(set: [Int], target: Int) -> [[Int]] {

    var result = [[Int]]()
    var cache = [Int: Int]()

    set.forEach { (value) in
        let complement = target - value

        if let cachedComplement = cache[complement] {
            result.append([value, cachedComplement])
        }

        cache[value] = value
    }

    return result

}

print (twoSum(set: [-10, 9, 4, -3, 2, 6, 8], target: 6))

func threeSum(set: [Int], target: Int) -> [[Int]] {

    var result = [[Int]]()

    for i in 0..<set.count {
        let value = set[i]
        var mutableSet = Array(set.suffix(from: i+1))
        let twoSumResults = twoSum(set: mutableSet, target: (target-value))
        let threeSumResults = twoSumResults.map { [value] + $0 }
        result += threeSumResults
    }

    return result
}

print (threeSum(set: [-10, 9, 4, -3, 2, 6, 8], target: 10))

func fourSum(set: [Int], target: Int) -> [[Int]] {

    var result = [[Int]]()

    for i in 0..<set.count {
        let value = set[i]
        var mutableSet = Array(set.suffix(from: i+1))
        let threeSumResults = threeSum(set: mutableSet, target: (target-value))
        let fourSumResults = threeSumResults.map { [value] + $0 }
        result += fourSumResults
    }

    return result
}

print (fourSum(set: [-10, 9, 4, -3, 2, 6, 8], target: 18))

func kSum(set: [Int], target: Int, k: Int) -> [[Int]] {

    var result = [[Int]]()

    if k == 2 {
        return twoSum(set: set, target: target)
    }

    for i in 0..<set.count {
        let value = set[i]
        var mutableSet = Array(set.suffix(from: i+1))
        result += kSum(set: mutableSet, target: (target-value), k: k-1).map{ [value] + $0 }
    }

    return result
}

print (kSum(set: [-10, 9, 4, -3, 2, 6, 8, 3, 5], target: 10, k: 6))

//: [Next](@next)
