//: [Previous](@previous)

import Foundation

var input = "aaaabbbafffffffcfcwwwbbbbaaaaaaaaabbbaffffffffffcfcwwwwwwwwbbbbaaaabbbafffffffffcfcwwwbbbbaaaabbbaffffffffffcfcwwwbbbbbbbbb"
var output = String()

var occurrence = -1
var previousCharacter: Character = Character("!")

input.forEach { (character) in

    if character == previousCharacter {
        occurrence += 1
    } else {
        if occurrence != -1 {
            output.append("\(occurrence)")
        }
        occurrence = 1
        output.append(character)
        previousCharacter = character
    }
}

if occurrence != 0 {
    output.append("\(occurrence)")
}

print (output)
let compression = 100 - (output.count * 100 / input.count)
print ("Compression is \(compression)%")

//: [Next](@next)
