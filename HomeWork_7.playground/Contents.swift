import Foundation

// შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.
enum weekDay {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

func weekdayAnswer(Day: weekDay) -> Void {
    switch Day {
    case .Saturday:
        print("Holiday")
    case .Sunday:
        print("Holiday")
    default:
        print("Working Day")
    }
}
weekdayAnswer(Day: weekDay.Saturday)
weekdayAnswer(Day: weekDay.Monday)


// შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს
enum GialaSquad {
    case TuGapatio
    case TsigroviManto
    case MoshishvlebuliMkerdi
    
    var description: String {
        switch self {
        case .TuGapatio:
            return "დაბალი დონე თუ გაპატიო"
        case .TsigroviManto:
            return "საშუალო დონე წიგროვი მანტო"
        case .MoshishvlebuliMkerdi:
            return "მაღალი დონე მოშიშვლებული მკერდი"
        }
    }
    
    var monthlyPrice: Int {
        switch self {
        case .TuGapatio:
            return 50
        case .TsigroviManto:
            return 75
        case .MoshishvlebuliMkerdi:
            return 100
        }
    }
    
    static func printPrices() {
        let ranks = [GialaSquad.TuGapatio, GialaSquad.TsigroviManto, GialaSquad.MoshishvlebuliMkerdi]
        let sortedRanks = ranks.sorted { $0.monthlyPrice > $1.monthlyPrice }
        
        print("ფასები ზევიდან ქვევით")
        for rank in sortedRanks {
            print("\(rank.description): $\(rank.monthlyPrice)")
        }
    }
}

// Example usage:
GialaSquad.printPrices()



// შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case Sunny(celsius: Int)
    case Cloudy(celsius: Int)
    case Rainy(celsius: Int)
    case Snowy(celsius: Int)
    
    static func recommendation(for weather: [Weather]) -> String {
        var recommendationString = ""
        
        for condition in weather {
            switch condition {
            case .Sunny(celsius: let celsius):
                if celsius > 30 {
                    recommendationString += "დუღს გაი ტიტველი , "
                } else {
                    recommendationString += "ცხელა პერანგი XXL , "
                }
            case .Cloudy(celsius: let celsius):
                if celsius > 15 {
                    recommendationString += "მოღრუბლულია ჰუდი შემოიხვია , "
                } else {
                    recommendationString += "კაიპირი არუჩანს კურტკა გააყოლე , "
                }
            case .Rainy(celsius: let celsius):
                if celsius < 15 {
                    recommendationString += "წუმს პლაში გააყოლე , "
                } else {
                    recommendationString += "<3 წადი ისერნე რაფერც გინდა , "
                }
            case .Snowy(celsius: let celsius):
                if celsius < 0 {
                    recommendationString += "**** დეეტიე სახლში , "
                } else {
                    recommendationString += "გაისვლება 2 წინდა , ელასტიკი , 2 შარვალი , მაისური პერანგი ჟილეტი დუბლიონკა  , "
                }
            }
        }
        
        return recommendationString
    }
}

let todayWeather: [Weather] = [.Sunny(celsius: 25), .Cloudy(celsius: 10), .Rainy(celsius: 12), .Snowy(celsius: -5)]
let recommendations = Weather.recommendation(for: todayWeather)
print(recommendations)



// შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    var album: String
    var releaseYear: Int
}
var kanyeAlbums: [Kanye] = []

var album1 = Kanye.init(album: "wake up mr.west", releaseYear: 2006)

var album2 = Kanye.init(album: "freshmen", releaseYear: 2016)

var album3 = Kanye.init(album: "yeezus", releaseYear: 2013)

var album4 = Kanye.init(album: "the graduate", releaseYear: 2007)

var album5 = Kanye.init(album: "gold", releaseYear: 2007)


kanyeAlbums.append(album1)
kanyeAlbums.append(album2)
kanyeAlbums.append(album3)
kanyeAlbums.append(album4)
kanyeAlbums.append(album5)


func albumsReleasedAfterYear(_ albums: [Kanye], _ year: Int) -> [Kanye] {
    var albumsAfter: [Kanye] = []
    for album in albums {
        if album.releaseYear > year {
            albumsAfter.append(album)
        }
    }
    
    
    return albumsAfter
}

let albumsAfter2008 = albumsReleasedAfterYear(kanyeAlbums, 2008)
print(albumsAfter2008)
 

// შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა


@propertyWrapper
struct CachedData {
    var value: String?
    let initializer: () -> String
    
    init(wrappedValue initializer: @escaping @autoclosure () -> String) {
        self.initializer = initializer
    }
    
    var wrappedValue: String {
        mutating get {
            if let value = value {
                return value
            } else {
                let initialValue = initializer()
                value = initialValue
                return initialValue
            }
        }
        set {
            value = newValue
        }
    }
}

struct Example {
    @CachedData var cachedData: String = "lazy ინიციალიზებულია"
}

var example = Example()
print(example.cachedData)
