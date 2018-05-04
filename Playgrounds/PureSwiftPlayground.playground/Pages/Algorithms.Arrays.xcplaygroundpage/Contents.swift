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

func calculateBetweenTwoPics (input: [Int]) -> Int {
    let minOfMaxes = input.first! < input.last! ? input.first! : input.last!
    let maxOfMaxes = input.first! > input.last! ? input.first! : input.last!

    var result = 0

    input.forEach { (value) in
        if value < maxOfMaxes {
            result += minOfMaxes - value
        }
    }

    return result
}

func pickTwoPics (input: [Int]) -> [Int] {
    // trouver les 2 pics non collés

    var mutableArray = input
    var max1 = 0
    var indexMax1 = 0
    var max2 = 0
    var indexMax2 = 0

    for i in 0..<mutableArray.count {
        let value = mutableArray[i]
        if value > max1 {
            max1 = value
            indexMax1 = i
        }
    }

    mutableArray[indexMax1] = 0

    for i in 0..<mutableArray.count {
        let value = mutableArray[i]
        if value > max2 {
            max2 = value
            indexMax2 = i
        }
    }

    mutableArray[indexMax2] = 0

    let range = indexMax1 < indexMax2 ? indexMax1...indexMax2 : indexMax2...indexMax1

    let slice = input[range]
    print (slice)
    return Array(slice)

}

print(calculateBetweenTwoPics(input: pickTwoPics(input: [2, 7, 1, 8, 4, 6, 10])))

//: [Next](@next)
