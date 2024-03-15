import Cocoa

// 1.while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.

var sum = 0
var count = 0
while count != 20{
    count += 1
    if count % 2 == 1 && sum == 0{
        sum += count
    } else if count % 2 == 1 {
        sum *= count
    }
}
print(sum)

let range = 1...20
var sum1 = 1
for add in range {
    if add % 2 == 1{
        sum1 *= add
    }
    
}
print(sum1)

// 2. შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

var Word = "Test"
var ReversedString = ""

for chars in Word{
    ReversedString = String(chars) + ReversedString
}
print(ReversedString)

// 3. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."

var whileI = 3
while whileI > 0 {
    switch whileI % 3 {
    case 0 :
        print("🔴")
    case 1 :
        print("🟡")
    case 2 :
        print ("🟢")
    default:
        break
    }
    whileI += 1
}



// 4. Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”
var ticket = 30

while ticket != 0 {
    ticket -= 1
    if ticket != 0{
        print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(ticket) რაოდენობა")
    }else{
        print("ყველა ბილეთი გაყიდულია გელოდებით კოცერტზე")
    }
}

// 5. შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)



let myArray = ["Lewis","Gio" , "Nika" , "Lasha" , "Vaso", "Lewis"]
var str = [""]
var Count = 0

for names in myArray {
    if str.contains(names){
        Count += 1
        continue
    }else{
        str.append(names)
    }
}
if Count == 0{
    print("Array-ში ყველა ელემენტი განსხვავებულია")
}else{
    print("Array შეიცავს მსგავს ელემენტს")
}




// 6. დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას

let difference : (Int , Int) -> (Int) = {FirstNumber , SecondNumber in

    if FirstNumber > SecondNumber{
        return FirstNumber - SecondNumber
    }else{
        return SecondNumber - FirstNumber
    }
}
difference(7,14)
difference(21,3)

// 7. დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.

func Consonants (Word : String) -> (Int){
    var count1 = 0
    let consonants = "qwrtypsdfghjklzxcvbnm"
    
    for cons in Word {
        
        for  char in consonants {
            if cons.lowercased() == char.lowercased() {
                count1 += 1
            }
        }
    }
    
    return count1
}

print(Consonants(Word: "Cristiano Ronaldo"))
print(Consonants(Word: "Lewis Hamilton"))

// 8. შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.

// დავალება მალე დაემატება 


// 9. დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ

func factorial (Numb1 : Int) -> () {
    var sum11 = 1
    for x in 1...Numb1{
        sum11 *= x
    }
        print(sum11)
}

factorial(Numb1: 3)


// 10. შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.


var array0 = [0,1,2,3,4,5,6,7,8,9,10]
var oddNumbs : Array? = []
var evenNumbs : Array? = []
for h in array0 {
    if  h % 2 == 1{
        oddNumbs?.append(h)
    }else {
        evenNumbs?.append(h)
    }
}
print(oddNumbs!)
print(evenNumbs!)

