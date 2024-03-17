import Cocoa

// 1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.
print("1------------")

var firstNumber = 5
var secondNumber = 3
var thirdNumber = 7
var sum = firstNumber * secondNumber * thirdNumber
print(sum)
//---------------------------------------------
var fNumber: Int = 3
var sNumber: Int = 2
var tNumber: Int = 5
print("The sum of these numbers are \(fNumber * sNumber * tNumber)")

//2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.
print("2------------")

var Number = 22

var Bool = Number % 2 == 0 ? true : false
if Bool == true {
    print("This number is even")
}else{
    print("This number is odd")
}
//-----------------------------------------------
var string = Number % 2 == 0 ? "ლუწია" : "კენტია"
print(string)

// 3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ
print("3------------")

let Name : String? = "Achi"
let Name1 : String? = nil

if let Name {
    print(Name)
}


//4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.
print("4------------")

let isRaining = true

if isRaining {
    print("ქოლგის წაღება არ დამავიწყდეს")
}
else{
    print("დღეს ქოლგა არ დამჭირდება")
    
}

//5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”
print("5------------")

let a = 5
let b = 10

if a > b {
    print("a მეტია")
}else if b > a {
    print("b მეტია")
}else if b == a {
    print("ტოლია")
}else{print("Something goes wrong")}

//6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.
print("6-------------")

let Char: Character = "A"
print(Char)

//7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი
print("7------------")

var Number10 = 33
var Number11 = 32

var FirstNumb = Number10 / 10
var SecondNumb = Number10 - (FirstNumb * 10)

if FirstNumb == SecondNumb {
    print("✅")
}else {
    print("❌")
}

//8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.
print("8------------")

var numberOfMonths = 12

if numberOfMonths == 12 || numberOfMonths > 0 && numberOfMonths <= 2 {
    print("ზამთარი")
}else if numberOfMonths >= 3 && numberOfMonths <= 5{
    print("გაზაფხული")
}else if numberOfMonths >= 6 && numberOfMonths <= 8 {
    print("ზაფხული")
}else if numberOfMonths >= 9 && numberOfMonths <= 11{
    print("შემოდგომა")
}else{
    print("შეიყვანეთ რიცხვი 1 დან 12 ამდე")
}

// 9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”
print("9------------")

var Number0 = 60
if Number0 % 3 == 0 && Number0 % 4 == 0 {
    print("იყოფა 3-ზე და 4-ზე")
}else if Number0 % 3 != 0 && Number0 % 4 == 0{
    print("იყოფა 4-ზე")
}else if Number0 % 3 == 0 && Number0 % 4 != 0{
    print("იყოფა 3-ზე")
}else{
    print("არცერთ რიცხვზე არ იყოფა")
}


//10. შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი
print("10------------")

var num1 = 3
var num2 = -3
var string1 = num1 - num2 == 0  || num1 + num2 == 0 ? "თანაბრადარი დაშორებული" : "არარი თანაბრად დაშორებული"

print(string1)
