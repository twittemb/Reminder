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
