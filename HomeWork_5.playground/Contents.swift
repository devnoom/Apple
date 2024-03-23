import Foundation

// 1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება  რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: "ანა","აირევი ივერია","მადამ)

func mirror(string: String) -> Bool {
    var answer = false
    var  reversedString = ""
    for char in string {
        reversedString = String(char) + reversedString
    }
    if string == reversedString {
        answer = true
    }else{
        answer = false
    }
    return answer
}

print(mirror(string: "ანა"))
print(mirror(string: "აირევი ივერია"))
print(mirror(string: "მადამ"))
print(mirror(string: "ვასო"))



// 2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვადრატებს დაპრინტავს და დააბრუნებს მნიშვნელობას.

func square (arraysNumb: [Int]) -> [Int] {
    var newArray: [Int] = []
    
    for number in arraysNumb {
        newArray.append(number*number)
    }
    
    return newArray
}


var testArray = [6,7,9]
print(square(arraysNumb: [2,4,5]))
print(square(arraysNumb: testArray))



// 3. დაწერეთ closure რომელიც გაფილტრავს ლუწ რიცხვების int-ებს array-დან

let unfiltered = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

let filtered = unfiltered.filter { number in
    return number % 2 == 0
}

print(filtered)

// 4. დაწერეთ ფუნქცია , რომელიც პარამეტრად იღებს int-ების მასივს. escape closure-ის მეშვეობით დაბეჭდეთ მოწოდებული მასივის ჯამი 5 წამის შემდეგ.
// დარწმუნდით რომ closure არის  escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება

func arrayEsc(cArray: [Int], closure: @escaping ([Int]) -> Int) {
    var final = 0
    DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
        final = closure(cArray)
        print("პასუხი რომელიც დაიბეჭდა 5 წამის შემდეგ არის  \(final)")
    }
}
arrayEsc(cArray: [2, 3, 5]) { numbers in
    return numbers.reduce(0, +)
}



// 5. შექმენით კონტაკტების dict სადაც key არის სახელი და value ტელეფონის ნომერი , დაამატეთ დაბეწდეთ/მოძებნეთ  და წაშალეთ კონტაკტი

var DictionaryList : [String: Int] = [
    "Achi":596554565,
    "Toka":599876747,
    "Avto":583990022,
    "Tamo":555421098
]

DictionaryList["Gela"] = 555888000 //დამატება
print(DictionaryList)
DictionaryList["Tamo"] = nil  // წაშლა
print(DictionaryList)
DictionaryList["Avto"] = 333333333  //შეცვლა
print(DictionaryList)
print(DictionaryList["Achi"]!) // მოძებნა

// 6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს

func sorteddic (DicArray : [String:Int]) -> [String]{
    var sortedArray: [String] = []
    for keey in DicArray.keys {
        sortedArray.append(keey.lowercased())
    }
    sortedArray.sort()
    return sortedArray
    
    
}

print(sorteddic(DicArray: DictionaryList))

// 7. შექმენით double-ების მასივი , შეავსეთ ეს თქვენთვის სასურველი რიცხვებით. loop-ის გამოჰყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ

let doubles : [Double] = [1.4 , 3,8 , 9.4 , 2,3 , 111.2 ,1 , 3.0 , 122.9 , 43.2 , 2.0]
var largets: Double = 0.0
for double in doubles {
    if double > largets{
        largets = double
       
    }
    
}
print(largets)


// 8. მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:

let lelaWhatMovementIsThis: [String: Int] = [

    "ღამის სიჩუმე გაფანტე": 235,

    "ვიხსენებ ყველაფერს თავიდან": 219,

    "სულელი წვიმა": 231,

    "ალალ მე": 231,

    "იდუმალი ღამე":221,

    "ჩუმად ნათქვამი": 199,

    "თეთრი ქარავანი" :221,

    "ძველი ვერხვები" :193
]
//დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში

func minutes (lela: [String : Int]) -> String {
    var seconds = 0
    for value in lela.values{
        seconds += value
    }
    var secondLeft =  seconds % 60
    var current = seconds - secondLeft
    var minutes = current / 60
    
    
    return "ლელას სიმღერების ხანგძლივობაა \(minutes) წთ და \(secondLeft) წამი"
}

print(minutes(lela: lelaWhatMovementIsThis))

//დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.
                                    // key   // value
func longAndShortSongs (lelaSongs: [String : Int]) -> Void
{
    var shortSong = ""
    var longSong = ""
    var songKey = 0
    for (key , value) in lelaSongs {
        if value > songKey{
            songKey = value
        }
        if value == songKey {
            longSong = key
        }
    }
        for (key , value) in lelaSongs {
            if value < songKey {
                songKey = value
            }
            if songKey == value {
                shortSong = key
            }
        }
    print("ყველაზე გრძელი სიმღრაა \(longSong) \nყველაზე მოკლე სიმღერაა \(shortSong)")
    }
   
    

longAndShortSongs(lelaSongs: lelaWhatMovementIsThis)


//დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას


//დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს


