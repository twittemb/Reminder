//: [Previous](@previous)

import Foundation

let jsonString = """
{
"title": "Thibault Wittemberg",
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

    enum CodingKeys: String, CodingKey {
        case name = "title"
        case age
        case sex
    }
}

let data = jsonString.data(using: .utf8)!

do {
    let thibault = try JSONDecoder().decode(Person.self, from: jsonString.data(using: .utf8)!)
    print("\(thibault)")
    
    let thibaultJSON = try JSONEncoder().encode(thibault).toString(withEncoding: .utf8)
    print(thibaultJSON)
} catch {
    print (error)
}

//: [Next](@next)
