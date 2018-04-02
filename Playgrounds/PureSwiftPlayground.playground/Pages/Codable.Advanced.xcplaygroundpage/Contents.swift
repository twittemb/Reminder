//: [Previous](@previous)

import Foundation

let jsonString = """
{
"firstName": "Thibault",
"lastName": "Wittemberg",
"details": {
        "age": 38,
        "sex": "1"
    }
}
"""

enum Sex: String, Codable {
    case male
    case female
}

extension Sex {
    static func from(string: String) -> Sex {
        if string == "1" {
            return .male
        }

        return .female
    }

    var sexAsString: String {
        switch self {
        case .male:
            return "1"
        default:
            return "0"
        }
    }
}

struct Person {
    let name: String
    let age: Int
    let sex: Sex

    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case details

        enum Details: String, CodingKey {
            case age
            case sex
        }
    }
}

extension Person: Decodable {
    init(from decoder: Decoder) throws {
        // decode first level values
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let firstName = try values.decode(String.self, forKey: .firstName)
        let lastName = try values.decode(String.self, forKey: .lastName)
        self.name = "\(firstName) \(lastName)"

        // decode nested Json values
        let detailsContainer = try values.nestedContainer(keyedBy: CodingKeys.Details.self, forKey: .details)
        self.age = try detailsContainer.decode(Int.self, forKey: .age)
        self.sex = Sex.from(string: try detailsContainer.decode(String.self, forKey: .sex))
    }
}

extension Person: Encodable {
    func encode(to encoder: Encoder) throws {
        // encode first level values
        var container = encoder.container(keyedBy: CodingKeys.self)
        let names = self.name.split (separator: " ").map{ String($0) }
        try container.encode(names[0], forKey: .firstName)
        try container.encode(names[1], forKey: .lastName)

        // encode nested Json values
        var detailsContainer = try container.nestedContainer(keyedBy: CodingKeys.Details.self, forKey: .details)
        try detailsContainer.encode(self.age, forKey: .age)
        try detailsContainer.encode(self.sex.sexAsString, forKey: .sex)
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
