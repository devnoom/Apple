import Foundation

protocol Car {
    var model: String { get }
    var year: Int { get }
    var color: String { get }
    var horsepower: Int { get }
    var price: Double { get }
    func getInfo() -> String
    
   
    
}
extension Car {
    func getInfo() -> String {
        return """
        Model: \(model)
        Year: \(year)
        Color: \(color)
        Horsepower: \(horsepower)
        Price: \(price)
        """
    }
}

class Audi: Car {
    var model: String
    var year: Int
    var color: String
    var horsepower: Int
    var price: Double
    unowned var subsidiaryCompany: Volkswagen?
    
    var interiorDesignSetter: ((InteriorDesign) -> Void)?
    
    init(model: String, year: Int, color: String, horsepower: Int, price: Double, subsidiaryCompany: Volkswagen?) {
        self.model = model
        self.year = year
        self.color = color
        self.horsepower = horsepower
        self.price = price
        self.subsidiaryCompany = subsidiaryCompany
        print("\(model) was initialized.")
        print("\n")
    }
    
    deinit {
        print("Audi \(model) has been deallocated.")
        print("\n")
    }
}

class Volkswagen: Car {
    var model: String
    var year: Int
    var color: String
    var horsepower: Int
    var price: Double
    weak var holdingCompany: Audi?
    
    var engineSelector: ((EngineChoice) -> Void)?
    
    init(model: String, year: Int, color: String, horsepower: Int, price: Double, holdingCompany: Audi?) {
        self.model = model
        self.year = year
        self.color = color
        self.horsepower = horsepower
        self.price = price
        self.holdingCompany = holdingCompany
        print("\(model) was initialized.")
        print("\n")
    }
    
    deinit {
        print("Volkswagen \(model) has been deallocated.")
        print("\n")
    }
}

enum InteriorDesign {
    case leather
    case fabric
    case suede
}

extension Audi {
    func setInteriorDesign(_ design: InteriorDesign) {
        switch design {
        case .leather:
            print("Setting interior design to leather for \(model)")
        case .fabric:
            print("Setting interior design to fabric for \(model)")
        case .suede:
            print("Setting interior design to suede for \(model)")
        }
    }
    
    
}
print("\n")
var A4 = Audi(model: "A4", year: 2022, color: "black", horsepower: 400, price: 56000.000, subsidiaryCompany: nil)

A4.setInteriorDesign(.leather)

struct EngineChoice {
    var type: String
    var power: Int
}


extension Volkswagen {
    func selectEngine(_ choice: EngineChoice) {
        print("\n")
        print("Selected \(choice.type) engine with \(choice.power) horsepower for \(model)")
    }
}
print("\n")
var TT = Volkswagen(model: "TT", year: 2023, color: "Black", horsepower: 200, price: 120000.000, holdingCompany: nil)

TT.selectEngine(EngineChoice(type: "turboDiezel", power: 600))

typealias RaceComparison = (Car, Car) -> Car

func race(car1: Car, car2: Car, comparison: RaceComparison) -> Car {
    print("Starting the race between \(car1.model) and \(car2.model)...")
    
    
    let winner = comparison(car1, car2)
    print("\n")
    print("The winner of the race is \(winner.model)!")
    
    return winner
}

let compareByHorsepower: RaceComparison = { car1, car2 in
    if car1.horsepower > car2.horsepower {
        return car1
    } else {
        return car2
    }
}

let compareByPrice: RaceComparison = { car1, car2 in
    if car1.price > car2.price {
        return car1
    } else {
        return car2
    }
}

let winnerByHorsepower = race(car1: A4, car2: TT, comparison: compareByHorsepower)

let winnerByPrice = race(car1: A4, car2: TT, comparison: compareByPrice)




TT.holdingCompany = A4
A4.subsidiaryCompany = TT

print("\n")
print(A4.getInfo())
print("\n")
print(TT.getInfo())


A4.subsidiaryCompany = nil
TT.holdingCompany = nil




