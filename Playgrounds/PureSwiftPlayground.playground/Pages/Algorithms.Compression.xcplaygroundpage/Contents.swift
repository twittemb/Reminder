//: [Previous](@previous)

import Foundation

var input = "aaaabbbafffffffcfcwwwbbbbaaaaaaaaabbbaffffffffffcfcwwwwwwwwbbbbaaaabbbafffffffffcfcwwwbbbbaaaabbbaffffffffffcfcwwwbbbbbbbbb"
var output = String()

var occurrence = -1
var previousCharacter: Character = Character("!")

// on parcours chacun des caracteres
input.forEach { (character) in

    if character == previousCharacter {
        // caractere identique au precedent -> on incremente l'occurence
        occurrence += 1
    } else {
        // nouveau caractere -> on ajoute l'occurence au tableau de resultat puis le nouveau caractere et on met son compteur a 1
        if occurrence != -1 {
            output.append("\(occurrence)")
        }
        occurrence = 1
        output.append(character)
        previousCharacter = character
    }
}

// derniere occurence
if occurrence != 0 {
    output.append("\(occurrence)")
}

print (output)
let compression = 100 - (output.count * 100 / input.count)
print ("Compression is \(compression)%")

//: [Next](@next)
