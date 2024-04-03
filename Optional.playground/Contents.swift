import Foundation

// MARK Lesson - 3

// შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”

var number = 23424

if number % 3 == 0  && number % 4 == 0{
    print ("იყოფა როგორც 3 -ზე ასევე 4 -ზე")
} else if number % 4 == 0 {
    print ("იყოფა 4 -ზე")
} else if number % 3 == 0 {
    print("იყოფა 3 -ზე")
} else {
    print("არ იყოფა არცერთზე")
}

// შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი

var num1 = 43
var num2 = -43

var answer = (abs(num1) == abs(num2)) ? "თანაბრად არიან დაშორებულები" : "არარიან თანაბრად  დაშორებულები"

print(answer)


// MARK Lesson - 4

//შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.

var firstArray = [8, 4, 9, 9, 0, 2,]
var secondArray = [1, 0, 9, 2, 3, 7, 0, 1 ]

var combinedArray = firstArray + secondArray

for _ in 0..<combinedArray.count - 1 {
    for j in 0..<combinedArray.count - 1 {
        if combinedArray[j] > combinedArray[j + 1] {
            let temp = combinedArray[j]
            combinedArray[j] = combinedArray[j + 1]
            combinedArray[j + 1] = temp
        }
    }
}
print("Sorted Array: \(combinedArray)")


// დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ

func factorial (number: Int) -> Int {
    var result = 1
    for i in 1...number {
        result *= i
    }
    return result
}

print(factorial(number: 5))

// შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.


var intsArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var  oddArray: [Int] = []
var evenArray: [Int] = []

for number in intsArray {
    if number % 2 == 0 {
        evenArray.append(number)
    }else {
        oddArray.append(number)
    }
}

print(oddArray)
print(evenArray)



// MARK - Lesson 5

// მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:


let lelaWhatMovementIsThis: [String: Int] = [

    "ღამის “სიჩუმე გაფანტ" : 235,

    "ვიხსენებ ყველაფერს თავიდან" : 219,

    "სულელი წვიმა" : 231,

    "ალალ მე" : 231,

    "იდუმალი ღამე" : 221,

    "ჩუმად ნათქვამი" : 199,

    "თეთრი ქარავანი" : 221,

    "ძველი ვერხვებ" : 193
]

// დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში

func getTotalDuration(songs: [String: Int]) -> String {
    
    let totalSeconds = songs.values.reduce(0, +)
 
    let minutes = totalSeconds / 60
    let seconds = totalSeconds % 60
    
    return "ლელას სიმღერების ხანგრძლივობაა \(minutes) წუთი და \(seconds) წამი"
}

print(getTotalDuration(songs: lelaWhatMovementIsThis))

// დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.

func shortAlongSongs (songs: [String : Int]) -> String {
    var longestSong = 0
    for song in songs {
        if song.value > longestSong {
            longestSong = song.value
        }
        
    }
    var shortestSong = longestSong
    for song in songs {
        if song.value < shortestSong {
            shortestSong = song.value
        }
    }
    return "ყველაზე მოკლე სიმღერაა \(shortestSong) და ყველაზე გრძელი სიმღერა \(longestSong)"
}

print(shortAlongSongs(songs: lelaWhatMovementIsThis))

// დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას

func averageDuration (songs: [String: Int]) -> String {
    
    var averageDurationIs = ((songs.values.reduce(0, +)) / songs.count)
    
    return "საშუალო ხანგრძლივობა არის \(averageDurationIs)"
}

print(averageDuration(songs: lelaWhatMovementIsThis))

// დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს

func randomSong (songs: [String: Int]) -> String {
    var songName = ""
    let randomNumber = Int.random(in: 0...songs.count)
    for song in songs where == randomNumber {
        songName = song.key
    }
    return "შემთხვევით არჩეული სიმღერაა  \(songName) !!!"
}

print(randomSong(songs: lelaWhatMovementIsThis))
