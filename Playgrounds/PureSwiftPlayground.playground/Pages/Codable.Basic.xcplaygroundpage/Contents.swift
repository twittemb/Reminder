//: [Previous](@previous)

import Foundation

let jsonString = """
{
"name": "Thibault Wittemberg",
"age": 38,
"sex": "male"
}
"""

enum Sex: String, Codable {
    case male
    case female
}

struct Person: Codable {
    let name: String
    let age: Int
    let sex: Sex
}

let data = jsonString.data(using: .utf8)!

do {
    let thibault = try JSONDecoder().decode(Person.self, from: jsonString.data(using: .utf8)!)
    print("Object from JSON: \(thibault)")
    
    let thibaultJSON = try JSONEncoder().encode(thibault).toString(withEncoding: .utf8)
    print("JSON from Object: \(thibaultJSON)")
} catch {
    print (error)
}

//: [Next](@next)
