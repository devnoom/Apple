import Foundation

// შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.


class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(BookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = BookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    func borrowedBook() {
        isBorrowed = true
    }
    
    func returnedBook() {
        isBorrowed = false
    }
    
}


//შევქმნათ Class Owner
//
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.

class Owner {
    let ownerID: Int
    let name: String
    var borrowedBooks: [Book]
    
    init(ownerID: Int, name: String, borrowedBooks: [Book] = []) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook (book: Book) -> Void {
        if book.isBorrowed {
            print("განათხოვდა")
        }else {
            print("ეს წიგნი უკვე წაღებულია")
        }
        borrowedBooks.append(book)
        book.borrowedBook()
    }
    
    func returBook (book: Book) -> Void {
        
        guard let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) else {
            print("\(name) ეს წიგნი არ წაურიათ")
            return
        }
        
        borrowedBooks.remove(at: index)
        book.returnedBook()
    }
}


//შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
//
class Library {
    var books: [Book]
    var owners: [Owner]
    
    init() {
        self.books = []
        self.owners = []
    }
    
    
    func addBook(book: Book) {
        self.books.append(book)
    }
    
    
    func addOwner(owner: Owner) {
        self.owners.append(owner)
    }
    
    
    func booksInLibrary() -> [Book] {
        return books.filter { !$0.isBorrowed }
    }
    
    
    func allBorrowedBooks() -> [Book] {
        return books.filter { $0.isBorrowed }
    }
    
    
    func searchOwner(byId ownerId: Int) -> Owner? {
        return owners.first { $0.ownerID == ownerId }
    }
    
    
    func findBorrowedBooks(byOwner owner: Owner) -> [Book] {
        return owner.borrowedBooks
    }
    
    func borrowBook(bookId: Int, byOwner ownerId: Int) {
        guard let book = books.first(where: { $0.bookID == bookId && !$0.isBorrowed }) else {
            print("ეს წიგნი არაა ხელმისაწვდომი")
            return
        }
        guard let owner = searchOwner(byId: ownerId) else {
            print("ესეთი owner ვერ მოიძებნა.")
            return
        }
        owner.borrowBook(book: book)
    }
}





//
//გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

var DonQuixote = Book.init(BookID: 1, title: "Don Quixote", author: "Miguel De Cervantes", isBorrowed: false)
var TheGreatGatsby = Book.init(BookID: 2, title: "The Great Gatsby", author: "F.Scott Fitzegarld", isBorrowed: false)
var s1974 = Book.init(BookID: 3, title: "1974", author: "George Orwell", isBorrowed: false)
var JaneEyre = Book.init(BookID: 4, title: "Jane Eyre", author: "Charlotte Bronte", isBorrowed: false)


var owner1 = Owner.init(ownerID: 1, name: "achi")
var owner2 = Owner.init(ownerID: 2, name: "gio")
var owner3 = Owner.init(ownerID: 3, name: "Dato")


var  library = Library()
library.addBook(book: s1974)
library.addBook(book: JaneEyre)
library.addBook(book: DonQuixote)
library.addBook(book: TheGreatGatsby)

library.addOwner(owner: owner1)
library.addOwner(owner: owner2)
library.addOwner(owner: owner3)



owner2.borrowBook(book: s1974)
owner1.borrowBook(book: TheGreatGatsby)
owner3.borrowBook(book: DonQuixote)

owner1.returBook(book: TheGreatGatsby)

print("ბიბლიოთეკაში არსებული წიგნები")
for book in library.booksInLibrary() {
    print("- \(book.title) by \(book.author)")
}

print("წაღბული წიგნები")
for book in library.allBorrowedBooks() {
    print("- \(book.title) by \(book.author)")
}

print("აჩის მიერ წაღებული წიგნი")
for book in owner1.borrowedBooks {
    print("- \(book.title) by \(book.author)")
}


//Optional:
//
//
//
//შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია. შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია:
//
//დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე. ”
//
//ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად
//
//სულის ტკივილამდე ვტკივილობ….
//
//იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ
//
//არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ
//
//ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე
//
//თქვენ მოჰკალით ძერა?
//
//ბებიააა... ბებია... ოლია მათხოვარი მევიდა...
//
//მზე აღარ ამოდის ჩაგვიჭრეს

