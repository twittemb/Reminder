//: [Previous](@previous)

import Foundation

///////////////////////////////
/// Decalage des elements d'un tableau vers la gauche ou la droite
///////////////////////////////

func shiftArray (input: [Int], shift: Int) -> [Int] {
    let size = input.count

    // structure d'accueil
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

///////////////////////////////
/// Classement dans un tableau de scores
///////////////////////////////

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

///////////////////////////////
/// Recherche binaire recursive (input trié)
///////////////////////////////

func binarySearchRecursif (input: [Int], target: Int, fromIndex: Int, toIndex: Int) -> Int {

    // determine un pivot
    let pivotIndex = (fromIndex + toIndex) / 2
    let pivotValue = input[pivotIndex]

    if pivotValue == target {
        return pivotIndex
    }

    if fromIndex == toIndex {
        return -1
    }

    // si le nombre a trouver est plus petit que le pivot, on cherche a gauche
    if target < pivotValue {
        return binarySearchRecursif(input: input, target: target, fromIndex: fromIndex, toIndex: pivotIndex-1)
    } else {
        // si le nombre a trouver est plus grand que le pivot, on cherche a droite
        return binarySearchRecursif(input: input, target: target, fromIndex: pivotIndex+1, toIndex: toIndex)
    }

    return -1
}

let sortedInput = [5, 5, 25, 50, 120, 125]
print ("binarySearchRecursif")
print (binarySearchRecursif(input: sortedInput, target: 50, fromIndex: 0, toIndex: sortedInput.count-1))

///////////////////////////////
/// Recherche binaire iterative (input trié)
///////////////////////////////

func binarySearchIteratif (input: [Int], target: Int) -> Int {

    var leftIndex = 0
    var rightIndex = input.count-1

    // au debut les 2 indexs sont les bornes inf et sup du tableau

    while leftIndex <= rightIndex {

        // determine un pivot
        let pivotIndex = (leftIndex + rightIndex) / 2
        let pivotValue = input[pivotIndex]

        if pivotValue == target {
            return pivotIndex
        }

        if target > pivotValue {
            // si le nombre a trouver est plus grand que le pivot, on cherche a droite (la borne inf devient l'index du pivot+1
            leftIndex = pivotIndex+1
        } else {
            // si le nombre a trouver est plus petit que le pivot, on cherche a gauche (la borne sup devient l'index du pivot-1
            rightIndex = pivotIndex-1
        }
    }

    return -1
}
print ("binarySearchIteratif")
print (binarySearchIteratif(input: sortedInput, target: 120))

///////////////////////////////
/// Pluie entre les barres graphes
///////////////////////////////

func rainAmount (input: [Int]) -> Int {
    // tableau qui represente de gauche a droite la plus haute valeur de proche en proche
    var leftToRight = [Int](0..<input.count)
    leftToRight[0] = input[0]
    for i in 1..<input.count{
        leftToRight[i] = input[i] > leftToRight[i-1] ? input[i] : leftToRight[i-1]
    }
    // tableau qui represente de droite a gauche la plus haute valeur de proche en proche
    var rightToLeft = [Int](0..<input.count)
    rightToLeft[input.count-1] = input[input.count-1]

    for i in 0..<input.count-1 {
        let index = (input.count-2-i)
        rightToLeft[index] = input[index] > rightToLeft[index+1] ? input[index] : rightToLeft[index+1]
    }

    // sum
    var result = 0
    // on parcours le tableau d'origine et on compare la valeur avec le mins des tableaux gauche et droite
    for i in 0..<input.count {
        let minValue = leftToRight[i] < rightToLeft[i] ? leftToRight[i] : rightToLeft[i]
        result += minValue - input[i]
    }

    return result
}

print (rainAmount(input: [1, 0, 2, 1, 3, 5, 3, 0, 3, 0, 2, 1]))


//: [Next](@next)
