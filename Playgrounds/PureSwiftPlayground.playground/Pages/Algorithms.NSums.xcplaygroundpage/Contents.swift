//: [Previous](@previous)

import Foundation

///////////////////////////////
/// 2SUM: cas de base
///////////////////////////////

func twoSum(set: [Int], target: Int) -> [[Int]] {

    var result = [[Int]]()
    var cache = [Int: Int]()

    // on parcours tous les elements du sets
    // et on les stocke au fur et a mesure dans une table de hachage
    // afin d'avoir un acces direct au complement du nombre en cours (evite a reparcours -> O(n) a la place de O(2n)
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

///////////////////////////////
/// 3SUM: Cas particulier du 2SUM
///////////////////////////////

func threeSum(set: [Int], target: Int) -> [[Int]] {

    var result = [[Int]]()

    // on parcours le tableau, on fixe un element et on applique le 2SUM avec le target - la valeur de l'element fixé
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

///////////////////////////////
/// 4SUM: Cas particulier du 3SUM
///////////////////////////////
func fourSum(set: [Int], target: Int) -> [[Int]] {

    var result = [[Int]]()

    // on parcours le tableau, on fixe un element et on applique le 3SUM avec le target - la valeur de l'element fixé
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

///////////////////////////////
/// kSUM: Generalisation du 3SUM/4SUM
///////////////////////////////
func kSum(set: [Int], target: Int, k: Int) -> [[Int]] {

    var result = [[Int]]()

    // condition d'arret de la recursivité (cas connu 2SUM)
    if k == 2 {
        return twoSum(set: set, target: target)
    }

    // on parcours le tableau et pour chaque valeur on applique le kSUM avec une profondeur -1 egt un target - la valeur de l'element fixé
    for i in 0..<set.count {
        let value = set[i]
        var mutableSet = Array(set.suffix(from: i+1))
        result += kSum(set: mutableSet, target: (target-value), k: k-1).map{ [value] + $0 }
    }

    return result
}

print (kSum(set: [-10, 9, 4, -3, 2, 6, 8, 3, 5], target: 10, k: 6))

//: [Next](@next)
