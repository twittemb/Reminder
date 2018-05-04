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

func Hanoi (nbDisks: Int, from: Int, to: Int) {
    guard nbDisks > 0 else { return }
    Hanoi(nbDisks: nbDisks-1, from: from, to: 3-(from+to))
    print ("Move 1 disque from \(from) to \(to)")
    Hanoi(nbDisks: nbDisks-1, from: 3-(from+to), to: to)
}

Hanoi (nbDisks: 30, from: 0, to: 2)

//: [Next](@next)
