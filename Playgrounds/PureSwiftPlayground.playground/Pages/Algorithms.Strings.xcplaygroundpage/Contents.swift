//: [Previous](@previous)

import Foundation

let input = "06:40:03AM"

func to24 (input: String) -> String {
    let timeItems = input.split(separator: ":")
    let hour = timeItems[0]
    let minute = timeItems[1]
    let second = timeItems[2].prefix(2)
    let indicator = timeItems[2].suffix(2)

    if indicator == "AM" {
        if hour == "12" {
            return "00:\(minute):\(second)"
        } else {
            return "\(hour):\(minute):\(second)"
        }
    } else if indicator == "PM" {
        if hour == "12" {
            return "12:\(minute):\(second)"
        }
        let newHour = Int(hour)!+12
        return "\(newHour):\(minute):\(second)"
    }

    return "Error"
}

print (to24(input: input))

func isPalindrome (leftSide: String, rightSide: String) -> Bool {

    var left = leftSide
    var right = rightSide
    print ("leftSide = \(leftSide)")
    print ("rightSide = \(rightSide)")

    if leftSide.count != rightSide.count {
        return false
    }

    if leftSide.count == 0 {
        return true
    }

    let lastLeftChar = left.removeLast()
    let firstRightChar = right.removeFirst()

    if lastLeftChar == firstRightChar {
        return isPalindrome(leftSide: String(left), rightSide: String(right))
    }

    return false
}

func palindromeRecursif (input: String) -> Bool {
    let leftSide = input.prefix(input.count / 2)
    let rightSide = input.suffix(input.count / 2)

    return isPalindrome(leftSide: String(leftSide), rightSide: String(rightSide))
}

print (palindromeRecursif(input: "nurrun"))

func palindromeIteratif (input: String) -> Bool {

    let characters = input.map { $0 }

    var leftIndex = 0
    var rightIndex = input.count-1

    while leftIndex <= rightIndex {

        if characters[leftIndex] == characters[rightIndex] {
            leftIndex += 1
            rightIndex -= 1
        } else {
            return false
        }
    }

    return true
}

print (palindromeIteratif(input: "nurun"))

//: [Next](@next)
