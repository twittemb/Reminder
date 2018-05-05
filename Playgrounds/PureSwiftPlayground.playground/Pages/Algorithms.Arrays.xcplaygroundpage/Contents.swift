//: [Previous](@previous)

import Foundation

func shiftArray (input: [Int], shift: Int) -> [Int] {
    let size = input.count
    var output = [Int](0..<size)
    for i in 0..<size {
        let value = input[i]
        let newIndex = shift < 0 ? (size+(i+shift)) % size : (i+shift) % size
        output[newIndex] = value
    }

    return output
}

let input = [1, 2, 3, 4, 5, 6, 7, 8]
let output = shiftArray(input: input, shift: -2)
print (output)

func climbingLeaderboard(scores: [Int], alice: [Int]) -> [Int]{

    var result = [Int]()

    // enleve les doublons
    var cleanedScores = [Int]()
    var previousScore = -1
    for i in 0..<scores.count {
        let currentScore = scores[i]
        if currentScore != previousScore {
            cleanedScores.append(currentScore)
        }
        previousScore = currentScore
    }

    var scoreIndex = cleanedScores.count-1
    alice.forEach { (value) in
        var found = false
        while !found {

            if scoreIndex < 0 {
                result.append(scoreIndex+2)
                found = true
                continue
            }

            let score = cleanedScores[scoreIndex]

            if value == score {
                result.append(scoreIndex+1)
                found = true
                continue
            }

            if value > score {
                scoreIndex -= 1
            } else {
                result.append(scoreIndex+2)
                found = true
                continue
            }
        }

    }

    return result
}

print (climbingLeaderboard(scores: [100, 100, 50, 40, 40, 20, 10], alice: [5, 5, 25, 50, 120, 120]))

func binarySearchRecursif (input: [Int], target: Int, fromIndex: Int, toIndex: Int) -> Int {

    let pivotIndex = (fromIndex + toIndex) / 2
    let pivotValue = input[pivotIndex]

    if pivotValue == target {
        return pivotIndex
    }

    if fromIndex == toIndex {
        return -1
    }

    if target < pivotValue {
        return binarySearchRecursif(input: input, target: target, fromIndex: fromIndex, toIndex: pivotIndex-1)
    } else {
        return binarySearchRecursif(input: input, target: target, fromIndex: pivotIndex+1, toIndex: toIndex)
    }

    return -1
}

let sortedInput = [5, 5, 25, 50, 120, 125]
print ("binarySearchRecursif")
print (binarySearchRecursif(input: sortedInput, target: 50, fromIndex: 0, toIndex: sortedInput.count-1))

func binarySearchIteratif (input: [Int], target: Int) -> Int {

    var leftIndex = 0
    var rightIndex = input.count-1

    while leftIndex <= rightIndex {

        let pivotIndex = (leftIndex + rightIndex) / 2
        let pivotValue = input[pivotIndex]

        if pivotValue == target {
            return pivotIndex
        }

        if target > pivotValue {
            leftIndex = pivotIndex+1
        } else {
            rightIndex = pivotIndex-1
        }
    }

    return -1
}
print ("binarySearchIteratif")
print (binarySearchIteratif(input: sortedInput, target: 120))

func rainAmount (input: [Int]) -> Int {
    // from left to right
    var leftToRight = [Int](0..<input.count)
    leftToRight[0] = input[0]
    for i in 1..<input.count{
        leftToRight[i] = input[i] > leftToRight[i-1] ? input[i] : leftToRight[i-1]
    }
    // from right to left
    var rightToLeft = [Int](0..<input.count)
    rightToLeft[input.count-1] = input[input.count-1]

    for i in 0..<input.count-1 {
        let index = (input.count-2-i)
        rightToLeft[index] = input[index] > rightToLeft[index+1] ? input[index] : rightToLeft[index+1]
    }

    // sum
    var result = 0
    for i in 0..<input.count {
        let minValue = leftToRight[i] < rightToLeft[i] ? leftToRight[i] : rightToLeft[i]
        result += minValue - input[i]
    }

    return result
}

print (rainAmount(input: [1, 0, 2, 1, 3, 5, 3, 0, 3, 0, 2, 1]))

//: [Next](@next)
