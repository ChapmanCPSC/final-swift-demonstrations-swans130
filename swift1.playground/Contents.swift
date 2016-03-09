//: Playground - noun: a place where people can play

import UIKit

//I updated swift as much as possible but it limits me on what I can do, future assignments will be done on a new Mac
//with the latest xcode and swift to allow full functionality. I commented out what gave errors.


//optional types
var str = "Hello, World"

//can't do this
//str = nil
//var age : Int = nil

//using optional types
var newString = Optional("What's up?")
print(str)
print(newString)

newString.dynamicType
newString = "Hello Ca"

newString.dynamicType
newString = nil

var newNewString : Optional<String>
print(newNewString)


func unwrapDemo (something: String?)
{
    //unwrap
    print(something!)
}

unwrapDemo("hello chase")

var string1 : String? = "test"
string1.dynamicType
var isString = string1! //unwrap
isString.dynamicType
var string2 : String?
//can't do this
//string2!.uppercaseString

var string3 : String?
string3 = "test"
//nil check
if string3 != nil
{
    string3!.uppercaseString
}

//conditional unwrap
string3?.uppercaseString

var maybeString : String!
//correct but no need to unwrap
//maybeString.uppercaseString

//nil check
if(maybeString != nil)
{
    print(maybeString.uppercaseString)
}
maybeString.dynamicType

//comparing
let s1 : String! = "chase"
let s2 : String? = "chase"
s1 == s2

class Person
{
    var age : Int?
    func howOld()
    {
        print(age)
    }
}

//let p = human()
// p.age = 25
// p.howOld()

//conditional unwrapping
var name : String?
//name = "chase"

let upperCase = name?.uppercaseString
upperCase.dynamicType

var p2 : Person? = nil
//conditionally call method
p2?.howOld()
p2 = Person()
p2?.age?.description

let stringY : String? = "chase"

stringY == "chase"




//*********Object Types*************
class Sound
{
    class func Dog(name: String) {
        print("\(name) goes woof")
    }
    class func Cat(name: String) {
        print("\(name) goes meow")
    }
}

//class methods
Sound.Dog("jim")
Sound.Cat("jane")

class Person1 {
    
    var name : String
    var age : Int
    
    //failable initializer
    init?(name : String, age: Int = 0) {
        
    //cant invoke instance methods yet
    self.name = name
    self.age = age
        
    if age < 0 {
    return nil
    }
        
    //now we can invoke
    self.speak()
    }
    
    func speak() {
        print("hello")
    }
}
//swift wont let me do this
//var p = Person(name: "George")
//var notBorn = Person(name : "chase" , age: -2)

//demo subscripts
class Color {
    private var colors = ["red", "blue", "yellow"]
    subscript(idx: Int) -> String {
        return colors[idx]
    }
}

let c = Color()
print("My favorite color is \(c[1])")

//enums
enum Blood {
    case ab
    case o
    case oNeg
}

let type = Blood.ab
//can have raw
enum Shoe : String {
    case jordan = "sneaker"
    case gucci = "loafer"
    case clark = "boot"
}

let shoeString = "sneaker"
let shoeshoe = Shoe(rawValue: shoeString) //optional
let unknown = Shoe(rawValue: "sss") // nil

//******STRUCTS CLASSES*******
enum Toddler : Int {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4

    mutating func next() {
        let nextToddler = Toddler(rawValue: self.rawValue+1)
        self = nextToddler!
    }
}

var myKid = Toddler.first
myKid.next()

class Dinosaur
{
    class var TrexArm : String {
        return "v short"
    }
    var name = ""
    var age = 0
    
    func hunt()
    {
        print("gonna eat you")
    }
}

struct Bird
{
    var name : String
    var age : Int
}

let d1 = Dinosaur()
let b1 = Bird(name: "", age: 0)
//classes reference types
let d2 = d1
d2.name = "ayo"
d1.name = "ahah"

//structs are value types
var b2 = b1
b2.name = "parrot"
b1

struct iOs
{
    static let className = "cpsc370"
    static let teacher = "ryan"
}

print("welcome to \(iOs.className)")

let dino = Dinosaur()
dino.name = "johnny"

let bird = Bird(name: "", age: 0)
//cant do this with struct
//birdy.name = "wee"
//still cant do this
//dino = Dinosaur()

class Girlfriend
{
    var name : String
    var age: Int
    init(name: String, age : Int = 0)
    {
        self.name = name
        self.age = age
    }
    
    convenience init()
    {
        //delegates to designated init
        self.init(name : "", age: 0)
        print("this was conveinant")
    }
    func complain()
    {
        print("nag nag nag")
    }
}

class Friend : Girlfriend
{
    final override func complain()
    {
        super.complain()
        print("im your friend I dont do that")
    }
    func shakeHands()
    {
        print("dap up")
    }
}

final class bestFriend : Girlfriend
{
    func feedMe()
    {
        print("here is some pizza")
    }
}

let john = Friend(name: "john", age: 24)
john.complain()
john.shakeHands()

let jim = bestFriend(name: "jim", age: 25)
jim.complain()
jim.feedMe()

//class TallFriend : bestFriend
//{
    //cant override complain
//}

//cant subclass final class


class meanDinosaur : Dinosaur
{
    override static var TrexArm : String {
        return "bigger"
    }
    
    override func hunt() {
        super.hunt()
        super.hunt()
        super.hunt()
    }
    func beNice()
    {
        print("not gonna kill you")
    }
}

let firstDino = Dinosaur()
let secondDino = meanDinosaur()

func makeDinoHunt(d : Dinosaur)
{
    d.hunt()
    let meanD = d as? meanDinosaur
    meanD?.beNice()
}

makeDinoHunt(firstDino)
makeDinoHunt(secondDino)


//*******PROTOCOLS and EXTENSIONS**********
protocol Swimmer
{
    var strokes : Int { get }
    func swim()
    func dive() -> Void
}

//cant create an instance
//let s = Swimmer()

class Dolphin : Swimmer
{
    var strokes : Int = 50
    func swim() {
        print("im swimming")
    }
    func dive() {
        print("Im diving")
    }
}

struct Shark : Swimmer
{
    var strokes : Int = 100
    func swim() {
        print("im coming for u")
    }
    func dive() {
        print("better watch out")
    }
}

let dol = Dolphin()
let sha = Shark()

func tellSwim(s: Swimmer)
{
    print("gonna swim at \(s.strokes) strokes per minute")
    s.swim()
}

tellSwim(dol)
tellSwim(sha)

//umbrella types
func anyObjectExpect(obj : AnyObject) {}
func anyClassExpect(cls : AnyClass) {}
func anyExpect(a : Any) {}

class Catt
{
    
}

anyObjectExpect("hi")
anyObjectExpect(dol)
//doesnt work
//anyObjectExpect(String)
anyObjectExpect(UIButton)
anyObjectExpect(Catt())
//anyClassExpect("")
//anyClassExpect(String)
//anyClassExpect(Dog())
anyClassExpect(Catt)
anyExpect("")
anyExpect(String)
anyExpect(Catt)
anyExpect(Catt())

//extensions
var test = "chase"
extension String {
    func isCool (s: String) -> String
    {
        return s + " is cool"
    }
}

test.isCool("chase")


//*****Collection Types*******


 //let something = Array<Int>()

let lost = [4,8,15,16,23,42]
//indexing
var myFavNumber = lost[1]
//slicing
//lost[0..1]

//lost.enumerate().forEach {print("fun")}
lost.map {$0 * 2 }

//my swift wont let me do this
//contains
//if lost.contains(4) {
  //  print("yes")
//}
//indexOf
//let indexof$ = lost.indexOf { (4) -> Bool in
// return "true"

func isEven(number : Int) -> Bool {
    return number % 2 == 0
}

var evens = lost.filter(isEven)
print(evens)

//lost.forEach { (num) -> () in
 //   print(num)

//for num in lost.enumerate()
   // {
       // print(num)
//}
//Dicitonary<String,Int>

var people = ["chase":24, "john":23, "jim":23]
let chase = people["chase"]

//let subset = people.filter { (k, v) -> Bool in
//    return k.containsString("chase")

//people.enumerate().forEach {print("very fun")}

//if people.contains("john") {
 //   print("yes")
//}
//map
//var mapped = people.map { (key,value) in ( key.uppercaseString, value) }



//****ERROR HANDLING*****


let err = NSError(domain: "com.chaseswanstrom", code: 1, userInfo: nil)

//my swift wont do this
//enum MathError : ErrorType
//{
//    case divisionByZero
//    case anotherError
//    case yetAnotherError
//}
//
//my swift wont do this
//func fail() throws
//{
//    throw MathError.divisonByZero
//}

//my swift wont do this
//do {
//try fail()
//}
//catch MathError.anotherError {
//    print("caught another error")
//}
//catch let error as MathError {
//    print("\(error) happened"
//}
//catch let error {
//    print("\(error) happened")
//}
//catch {
//    print("error")
//}

//******FLOW CONTROL*******

enum BloodType
{
    case ab
    case o
    case oneg
}

//switch
let typed : BloodType = .o

switch typed {
    case .ab:
    print("blood")
    case .o:
    print("bloood")
    fallthrough
    case .oneg:
    print("bloooood")
    default:
    print("none")
}

//ternary operators
let num = 123
let spec = (num > 100) ? "yes" : "no"

//while binding
var names1 : [String] = ["chase", "john", "jim"]
//while let n = names1.popLast()
//{
//    print(name)
//}
//for n in names1 where n == "chase"
//{
//    print("im chase")
//}

//labeled break
let pixel = (4,7)
outer: for x in 0...10
{
    for y in 0...10
    {
        if x == pixel.0 && y == pixel.1
        {
            break outer
        }
    }
}
