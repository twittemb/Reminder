//: [Previous](@previous)

struct Coffee: Liquid {
    let viscosity: Float = 3.4
    let color = "black"
    var temperature: Float
}

struct Milk: Liquid {
    let viscosity: Float = 2.2
    let color = "white"
    var temperature: Float
}

class CeramicCup<L: Liquid>: Cup {
    var liquid: L?

    func fill(with liquid: L) {
        self.liquid = liquid
        self.liquid!.temperature -= 1
    }
}

class PlasticCup<L: Liquid>: Cup {
    var liquid: L?

    func fill(with liquid: L) {
        self.liquid = liquid
        self.liquid!.temperature -= 10
    }
}

var coffeeCups = [AnyCup<Coffee>]()
coffeeCups.append(AnyCup<Coffee>(with: CeramicCup<Coffee>()))
coffeeCups.append(AnyCup<Coffee>(with: PlasticCup<Coffee>()))

coffeeCups.forEach { (anyCup) in
    anyCup.fill(with: Coffee(temperature: 60.4))
    print(anyCup.liquid!.color)
    print(anyCup.liquid!.temperature)
}

var milkCups = [AnyCup<Milk>]()
milkCups.append(AnyCup<Milk>(with: CeramicCup<Milk>()))
milkCups.append(AnyCup<Milk>(with: PlasticCup<Milk>()))

milkCups.forEach { (anyCup) in
    anyCup.fill(with: Milk(temperature: 30.9))
    print(anyCup.liquid!.color)
    print(anyCup.liquid!.temperature)
}

//: [Next](@next)
