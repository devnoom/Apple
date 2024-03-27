import Cocoa

// შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)

enum Gender {
    case male
    case female
}

// შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender

protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }
}


// SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა

extension SuperBeing {
    var strength: Int { return 50 }
    var speed: Int { return 50 }
}

// შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.

// გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String
//
//გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).
//
//გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)



class SuperHero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var outfitColor: String
    var equipment: String
    var vehicle: String
    
    init(name: String, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    
    var Hero = SuperHero(name: "Davit-a", weakness: "Xcode", gender: Gender.male, outfitColor: "black", equipment: "shield", vehicle: "prius")
    
    func rescue (injured: String) {
        
        print("\(self.name) არ შეუშინდა საფიხათო სიტუაციას და \(injured) იხსნა სტუდენტებისგან")
    }
    func combat (villain: SuperVillain){
        print("\(self.name) -მა დაამარცა \(villain.name)")
    }
    
}
// გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String
//
//გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
//“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)

//გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
//“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ //აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)

class SuperVillain: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var evilScheme: String
    var obsession: String
    var rivalry: String
    
    init(name: String, weakness: String, gender: Gender, evilScheme: String, obsession: String, rivalry: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }
    func attack (hero: SuperHero){
        print("ბოროტმოქმედი \(self.name) გეგმასვს თავდასხმას და მთელი ქალაქის მიწასთან გასწპრებას, საეჭვოა \(hero.name) მის შეჩერებას თუ შეძლებს ")
    }
    func experimentation (injured: String){
        print("\(self.name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(injured) აღმოჩნდა")
    }
}


var spiderMan = SuperHero(name: "Spider-Man", weakness: "Emotional vulnerability", gender: .male, outfitColor: "Red and Blue", equipment: "Web shooters", vehicle: "None")

var ironMan = SuperHero(name: "Iron Man", weakness: "Human vulnerability", gender: .male, outfitColor: "Red and Gold", equipment: "Iron Man suit", vehicle: "Iron Man suit (Mark XLV)")

var captainAmerica = SuperHero(name: "Captain America", weakness: "Vibranium shield vulnerability", gender: .male, outfitColor: "Red, White, and Blue", equipment: "Vibranium shield", vehicle: "Motorcycle")

var blackPanther = SuperHero(name: "Black Panther", weakness: "Emotional trauma", gender: .male, outfitColor: "Black", equipment: "Vibranium suit", vehicle: "Royal Talon Fighter")

var thor = SuperHero(name: "Thor", weakness: "Mjolnir dependency", gender: .male, outfitColor: "Red cape", equipment: "Mjolnir", vehicle: "Bifrost")



let greenGoblin = SuperVillain(name: "Green Goblin", weakness: "Emotional instability", gender: .male, evilScheme: "Create chaos in New York City", obsession: "Defeating Spider-Man", rivalry: "Spider-Man")

let thanos = SuperVillain(name: "Thanos", weakness: "Emotional vulnerability", gender: .male, evilScheme: "Wipe out half of the universe's population", obsession: "Balancing the universe", rivalry: "The Avengers")

let joker = SuperVillain(name: "Joker", weakness: "Human vulnerability", gender: .male, evilScheme: "Create chaos in Gotham City", obsession: "Messing with Batman's mind", rivalry: "Batman")

let magneto = SuperVillain(name: "Magneto", weakness: "Xavier's persuasion", gender: .male, evilScheme: "Mutant supremacy", obsession: "Protecting mutantkind", rivalry: "X-Men")

let loki = SuperVillain(name: "Loki", weakness: "Inferiority complex", gender: .male, evilScheme: "Conquer Asgard", obsession: "Proving himself worthy", rivalry: "Thor")




