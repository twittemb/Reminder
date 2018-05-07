import Foundation

public func execute (name: String, input: [Int], algorithm: ([Int]) -> [Int]) {
    let start = DispatchTime.now()
    let sorted = algorithm(input)
    let end = DispatchTime.now()

    print ("----------------------------------------")
    print ("\(name) Sort in \(end.uptimeNanoseconds - start.uptimeNanoseconds) nanoseconds")
    print ("\(name) Sort result \(sorted)")
    print ("----------------------------------------")
}

///////////////////////////////
/// INSERTION SORT
///////////////////////////////

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    // 1
    var leftIndex = 0
    var rightIndex = 0

    // 2
    var orderedPile = [Int]()

    // 3
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }

    // 4
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }

    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }

    return orderedPile
}

public func mergeSort(input: [Int]) -> [Int] {
    guard input.count > 1 else { return input }    // 1

    let middleIndex = input.count / 2              // 2

    let leftArray = mergeSort(input: Array(input[0..<middleIndex]))             // 3

    let rightArray = mergeSort(input: Array(input[middleIndex..<input.count]))  // 4

    return merge(leftPile: leftArray, rightPile: rightArray)             // 5
}

///////////////////////////////
/// INSERTION SORT
///////////////////////////////

public func stackSort (input: [Int]) -> [Int] {
    var sortedArray = [Int]()

    input.forEach { value in
        var index = 0
        for sortedValue in sortedArray {
            if sortedValue >= value {
                break
            }
            index += 1
        }
        sortedArray.insert(value, at: index)
    }

    return sortedArray
}

///////////////////////////////
/// QUICK SORT
///////////////////////////////

public func quickSort (input: [Int]) -> [Int] {

    if input.count <= 1 {
        return input
    }

    let pivotValue = input[input.count / 2]
    let lessThanPivot = input.filter { $0 < pivotValue}
    let equalPivot = input.filter { $0 == pivotValue}
    let moreThanPivot = input.filter { $0 > pivotValue}

    return quickSort(input: lessThanPivot) + equalPivot + quickSort(input: moreThanPivot)
}

///////////////////////////////
/// BINARY TREE SORT
///////////////////////////////

public class Node {
    let value: Int
    var leftNode: Node?
    var rightNode: Node?

    init(withValue value: Int) {
        self.value = value
    }
}

public func printNode (node: Node) -> [Int] {

    var result = [Int]()

    if let leftNode = node.leftNode {
        result += printNode(node: leftNode)
    }

    result.append(node.value)

    if let rightNode = node.rightNode {
        result += printNode(node: rightNode)
    }

    return result
}

public func treeSort (input: [Int]) -> [Int] {

    guard input.count > 0 else { return []}

    var currentNode = Node(withValue: input[0])
    let root = currentNode

    // constitution de l'arbre
    for i in 1..<input.count {
        var found = false
        currentNode = root
        while !found {
            if input[i] <= currentNode.value {
                if let leftNode = currentNode.leftNode {
                    currentNode = leftNode
                } else {
                    let newNode = Node(withValue: input[i])
                    currentNode.leftNode = newNode
                    found = true
                }
            } else {
                if let rightNode = currentNode.rightNode {
                    currentNode = rightNode
                } else {
                    let newNode = Node(withValue: input[i])
                    currentNode.rightNode = newNode
                    found = true
                }
            }

        }
    }

    // parcours de l'arbre
    return printNode(node: root)
}
