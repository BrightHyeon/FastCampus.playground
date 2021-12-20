import UIKit
import os

//상수와 변수
//ex) 기기의 전체공간 - 상수, 현재 사용가능한 공간 - 변수

//Array

var numbers: Array<Int> = Array<Int>()

numbers.append(1)
numbers.append(2)
numbers.append(3)

numbers[0]
numbers[1]

numbers.insert(4, at: 2)
numbers

numbers.remove(at: 0)
numbers

var names: [String] = []
//var names = [String]()
//print(type(of: names))


//Dictionary
//var dic: Dictionary<String, Int> = Dictionary<String, Int>()

//var dic: [String: Int] = [:]
var dic: [String: Int] = ["김현수": 1]

dic["한병찬"] = 2
dic["송병훈"] = 3
dic

dic["김현수"] = 7
dic

dic.removeValue(forKey: "송병훈")
dic

var set: Set = Set<Int>() //축약형 없음.

set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set

set.remove(20)
set

//함수; 작업의 가장 작은 단위. 반복적인 프로그래밍을 피하기 위함.
//여러번 반복 수행 시에 유리함.

func sum(a: Int, b: Int) -> Int {
    return a + b
}

sum(a: 5, b: 3)

func hello() -> String {
    return "Hello"
}

hello()

func printName() {
    
}


func greeting(friend: String, me: String = "현수")  { //기본값 저장
    print("Hello, \(friend)! I'm \(me)")
}

greeting(friend: "병찬")

//전달인자 레이블
func sendMessage(from myName: String, to name: String) -> String {
    return "hello \(name)! I'm \(myName)"
}

sendMessage(from: "현수", to: "병훈") //사용자 입장에서 매개변수의 역할을 좀 더 명확하게 표현하기 위함.(코드의 가독성)

func sendMail(_ name: String) -> String { //와일드카드
    return "Hello, I'm\(name)!"
}
sendMail("난 현수야")

//가변매개변수 - 배열형태로 값을 받음// 함수마다 하나만 가질 수 있음.

func sendEmail(_ me: String, friends: String...) -> String {
    return "Hello \(friends)!!! I'm \(me)!"
}

sendEmail("Swiftist", friends: "HogartCTO", "HogartCCO")

//스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이기 때문에 스위프트의 함수는 '일급 객체'임.
//그래서 함수를 변수, 상수 등에 할당할 수 있고, 매개변수를 통해 전달이 가능. 클로저 강의에서 자세히 알아보자~!

//조건문; if, switch, guard

let age = 20

if age < 19 {
    print("미성년자 입니다.")
}

if age < 19 {
    print("미성년자")
} else {
    print("성년자")
}

//switch는 if와 달리 pattern 기반으로 실행함.

let color = "green"

switch color {
case "blue":
    print("파란색 입니다.")
case "green":
    print("초록색 입니다.")
case "yellow":
    print("노란색 입니다.")
default:
    print("찾는 색상이 없습니다.")
}
//범위연산자도 사용 가능.

let temperature = 30

switch temperature {
case -20...9:
    print("겨울입니다.")
case 10...14:
    print("가을입니다.")
case 15...25:
    print("봄입니다.")
case 26...35:
    print("여릅입니다.")
default:
    print("이상기후입니다.")
}

//반복문
//만약 어떤 함수를 백번 호출할 일이 있을 때, 반복문 없이는 함수호출코드를 백번 써야함...

/*
 for 루프상수 in 순회대상 { //Set, Array, Dictionary, 범위데이터, 문자열 등 타입의 변수나, 상수를 사용가능.
    실행할 구문..
 }
 */

for i in 1...4 {
    print(i)
}

let array = [1,2,3,4,5]

for i in array {
    print(i)
}

//for-in 구문 - 미리 정의된 실행횟수만큼 반복.
//while 구문 - 주어진 조건이 false가 될 때까지 실행구문을 계속해서 반복실행.

/*
 while 조건식 { //조건식의 반환값: 반드시 불리언 타입
    실행할 구문
 }
 */

var number = 5

while number < 10 {
    number += 1
}

number

//while true라고 쓰면 무한루프.

//repeat-while; while처럼 조건에 따라 구문을 반복실행하지만, 적어도 반드시 한 번은 구문을 실행하는 놈.

/*
 repeat {
    실행할 구문
 } while 조건식
 */

var x = 6

//while x < 5 {
//    x += 2
//}

repeat {
    x += 2
} while x < 5 //조건이 맞지않아도, 적어도 한번은 repeat 구문이 실행됨. 이게 포인트.

//옵셔널; 값이 있을 수도 없을 수도 있다.

//값이 있을 수도 없을 수도 있는 변수를 정의할 때 옵셔널을 사용.
//nil을 사용하기 위함(안전성면) & 꼭 값이 있어야만 하는 것이 아닐 때?

var name: String?

var optionalName: String? = "swiftist"
//print(optionalName)      //Optional("swiftist")

// var requireName: String = optionalName //error: 옵셔널타입과 옵셔널이 아닌 타입은 서로 대입안됨.

//옵셔널 해제 방법
//명시적 해제; 강제 추출, 옵셔널 바인딩(비강제 해제)

var nums: Int? = 3
//print(nums)          //Optional(3)
print(nums!) //강제 해제는 매우 위험. 만약 값이 nil인 옵셔널을 강제해제할 경우, error가 발생해 프로그램이 강제종료될 수 있음.

if let result = nums { //옵셔널을 추출해서 할당받을 변수나 상수를 선언
    print(result)
} else { //값 추출에 실패할 시 실행. nil일 경우.
    
}

func test() {
    let number: Int? = 5
    guard let result = number else { return }
    print(result)
}

test()

//if 옵셔널 바인딩 할 경우: 옵셔널이 추출된 변수나 상수를 if블럭 내에서만 사용 가능.
//guard 옵셔널 바인딩 할 경우: guard문 다음 함수 전체 구문에서 추출된 변수나 상수를 사용 가능. 조건이 true일때만 guard문을 통과. false이면 흐름을 종료시킴.

//묵시적 해제; 컴파일러에 의한 자동 해제, 옵셔널의 묵시적 해제

//컴파일러에 의한 자동 해제: 옵셔널 값을 비교 연산자를 이용해 다른 값과 비교하면 컴파일러가 자동으로 옵셔널 값을 해제시켜줌.

let value: Int? = 6
if value == 6 { // 비교연산자 이용.
    print("value가 6입니다.")
} else {
    print("value가 6이 아닙니다.")
}

//묵시적 해제

let string = "12"
var stringToInt: Int! = Int(string) //Int(string) 함수의 경우 무조건 옵셔널 타입으로 선언해야함. Int()함수를 쓴다해서 모든 걸 Int화 시킬 수 있는 것이 아니기에.
print(stringToInt + 1) // 타입 뒤에 !가 붙어있는 변수는 사용 시, 옵셔널이 묵시적(암시적)으로 해제가 되서 일반값처럼 자유롭게 연산 가능.

//구조체

//구조체 vs 클래스
//구조체와 클래스는 프로그래머가 데이터를 용도에 맞게 표현하고자 할 때 유용.
//프로퍼티와 메서드를 사용해서 구조화된 데이터와 기능을 가질 수 있어 하나의 새로운 사용자 정의 데이터 타입을 만들어주는 것.
//문법과 사용법은 거의 비슷함.
//차이점: 구조체의 인스턴스는 '값 타입', 클래스의 인스턴스는 '참조 타입' ; 이 내용은 별도 강의 있음.

//-------------------------------------------------졸았으니 다시듣기-----------------------------------
//유저의 정보를 구성하는 구조체 구성.
struct User {
    var nickname: String
    var age: Int
    
    func information() {
        print("\(nickname) \(age)")
    }}
//구조체를 사용하려면 인스턴스를 생성해줘야 함.
//인스턴스를 생성한다는 것: 클래스나 구조체를 실제로 사용하기 위해서 메모리를 사용한다는 것. (메모리에 생성된 실체)
var user = User(nickname: "swiftist", age: 25)
//생성자를 따로 안만들어줘도 기본적으로 생성됨. 생성자의 매개변수를 초기화할 수 있게 제안됨.

user.nickname
user.nickname = "swifter"
user.nickname

user.information()

//클래스

//강아지의 정보를 구성하는 클래스 구성
class Dog {
    var dogName: String = ""
    var dogAge: Int = 0
    
    //class에서는 생성자를 정의해줘야 함. 인스턴스를 생성하고, 초기화하고자 할 때, 기본적인 생성자(이니셜라이져)를 사용.
    //생성자를 안만들어줘도 기본으로 생성됨.
    init() { // 기본 생성자.
    }
    
    func introduce() {
        print("name is \(dogName) age \(dogAge)")
    }
}

var dog = Dog() //타입이 Dog, 받는 값은 Dog() //하나의 타입이자, 값이 되는 것.
print(type(of: dog))
dog.dogName = "Coco"
dog.dogAge = 3
dog.dogName
dog.dogAge

dog.introduce()

//초기화 구문 init
//클래스, 구조체, 열거형의 인스턴스를 사용하기 위한 준비 과정

//인스턴스를 초기화(이니셜라이즈)하는 이유 : 인스턴스의 프로퍼티마다 초깃값을 설정해주고, 새 인스턴스를 사용하기 전에 필요한 설정을 해주기 위해서 사용.
//이니셜라이저는 특정 타입의 새로운 인스턴스가 생성될 때 호출이 됨.

//-------------------------------------------------졸았으니 다시듣기-----------------------------------

struct initStudy {
    var nickname: String = "Hyeonsoo"
    var age: Int = 25
    
    init() {
        //인스턴스가 생성되면 이 블럭 안의 코드가 실행되게 됨.
    }
}

//초기화 구문
/*
 init(매개변수: 타입, ...) {
    프로퍼티 초기화
    인스턴스 생성시 필요한 설정을 해주는 코드 작성
 }
 */

class Users {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int) {
        self.nickname = nickname
        self.age = age
    }
    init(age: Int) {
        self.nickname = "뱅찬" //매개변수로 입력받지 않고, 생성자 안에서 프로퍼티 값을 대입할 수도 있음.
        self.age = age
    }
    deinit {
        print("deinit 실행")
    }
}

var users = Users(nickname: "병훈", age: 25)
users.nickname
users.age

var user2 = Users(age: 27)
user2.nickname
user2.age

//deinit
//이니셜라이저와 반대되는 역할
//인스턴스가 메모리에서 해제되기 직전에 호출되고, 클래스 인스턴스와 관련하여 원하는 정리작업을 구현할 수 있음.
//클래스의 인스턴스에만 구현 가능.
var user3: Users? = Users(nickname: "디이니셜라이저", age: 77)
user3 = nil //'deinit 실행' 출력 - nil값 들어오면 메모리에서 해제됨. 이때 deinit 구문 실행됨.

//프로퍼티
//클래스, 구조체 또는 열거형 등에 관련된 값. 인스턴스에 소속된 변수 및 속성.
//저장 프로퍼티; 변수나 상수로 선언.

struct Cat {
    var name: String
    let gender: String
}

var cat = Cat(name: "bengal", gender: "Female")
print(cat) //인스턴스에 프로퍼티의 값이 저장된 걸 '저장 프로퍼티'라 함.

cat.name = "sham"
// cat.gender = "Male" //error: gender프로퍼티는 상수 선언이니까.

let cat2 = Cat(name: "냥이", gender: "Male")
//cat2.name = "냥냥이" //error: 인스턴스가 상수 선언이니까.
//구조체가 값 타입이기에 나타나는 일.
//구조체 인스턴스를 상수로 선언하면 내부 프로퍼티도 모두 상수가 되서 수정불가능하게 됨.
//클래스는 참조 타입이라서 다르게 나타남.
//상수로 선언해도 변수로 지정한 프로퍼티 값을 바꿀 수 있음.

class Cat2 {
    var name: String
    let gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}

let cats = Cat2(name: "json", gender: "male")
cats.name = "jason"
print(cats.name)
//상수로 인스턴스 선언해도 값 바꿀 수 있는 모습.

//연산 프로퍼티
//열거형에서도 사용가능.
//값을 직접적으로 저장하지 않고, get, set을 통해서 다른 프로퍼티와 값을 접근.

struct Stock {
    var averagePrice: Int
    var quanity: Int
    var purchasePrice: Int {
        get { //getter; 접근자; 값을 불러올 때 return 값(연산식)을 출력.
            return averagePrice * quanity
        } //getter만 사용도 가능. 이 때는 읽기 전용이기에 값을 바꿀 수는 없음.
        set(newPrice) { //setter; 설정자; 값이 바뀔 때 다른 내부 프로퍼티 값을 간접적으로 설정.
            averagePrice = newPrice / quanity
        } //매개변수 설정안하면 default값이 newValue임.
    }
}
var stock = Stock(averagePrice: 2300, quanity: 3)
print(stock)
stock.purchasePrice
stock.purchasePrice = 3000
stock.averagePrice

//프로퍼티 옵저버(감시자)
//프로퍼티의 값의 변화를 관찰하고 반영함.
//새로운 값이 기존값과 같더라도 프로퍼티 옵저버는 호출됨.
//프로퍼티가 set될 때마다 호출됨.
//3가지 경우에만 사용가능: 1) 저장프로퍼티 2) 오버라이딩된 저장 계산 프로퍼티

class Account {
    var credit: Int = 0 { //저장형 프로퍼티
        willSet { //값이 저장되기 직전에 호출됨.
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        } //매개변수이름 지정도 가능. 안하면 디폴트로 뉴밸류, 올드밸류 쓰면된다.
        didSet { //값이 저장된 직후에 호출됨.
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

var account = Account()
account.credit = 1000

//타입 프로퍼티
//인스턴스 생성 없이 객체(구조체,클래스 등) 내의 프로퍼티에 접근가능하게 하는것.
//프로퍼티 타입자체와 연결하는 것.
//저장프로퍼티와 연산프로퍼티에 사용가능.

struct SomeStructure {
    static var storedTypeProperty = "Some value." //스토어
    
    static var computedTypeProperty: Int { //컴퓨티드
        return 1
    }
}

SomeStructure.computedTypeProperty
SomeStructure.storedTypeProperty
//값도 변경가능.
SomeStructure.storedTypeProperty = "Any value"
SomeStructure.storedTypeProperty
//변수에 할당하지않고도 접근이 가능.

//클래스와 구조체의 차이
/* 공통점
 1) 값을 저장할 프로퍼티를 선언할 수 있습니다.
 2) 함수적 기능을 하는 메서드를 선언할 수 있습니다.
 3) 내부 값에 .을 사용하여 접근할 수 있습니다.
 4) 생성자를 사용해 초기 상태를 설정할 수 있습니다.
 5) extension을 사용하여 기능을 확장할 수 있습니다.
 6) Protocol을 채택하여 기능을 설정할 수 있습니다.
 */

/* 차이점
 <class 클래스>
 1) 참조 타입
    (메모리Stack영역에는 포인터, 인스턴스의 메모리 주소만 할당이 되고, 실제 데이터는 Heap영역에 할당됨.)
 2) ARC로 메모리를 관리 //추후 설명할 것임.
 3) 상속이 가능
 4) 타입 캐스팅을 통해 런타임에서 클래스 인스턴스의 타입을 확인할 수 있음.
 5) deinit을 사용하여 클래스 인스턴스의 메모리 할당을 해제할 수 있음.
 6) 같은 클래스 인스턴스를 여러 개의 변수에 할당한 뒤 값을 변경시키면 모든 변수에 영향을 줌.
    (메모리가 복사 됨.)
 
 <struct 구조체>
 1) 값 타입
 2) 구조체 변수를 새로운 변수에 할당할 때마다 새로운 구조체가 할당됩니다.
 3) 즉 같은 구조체를 여러 개의 변수에 할당한 뒤 값을 변경시키더라도 다른 변수에 영향을 주지 않음.
    (값 자체를 복사)
 */

class SomeClass {
    var count: Int = 0
}

struct SomeStruct {
    var count: Int = 0
}

var class1 = SomeClass()
var class2 = class1
var class3 = class2

class3.count = 2
class1.count

var struct1 = SomeStruct()
var struct2 = struct1
var struct3 = struct1

struct2.count = 3
struct3.count = 4
struct1.count
struct2.count
struct3.count
//매번 새로운 메모리가 할당됨.

//상속
//상속받은 클래스: 자식클래스; SubClass
//상속한 클래스: 부모클래스; SuperClass
//상속하지도 받지도 않은 클래스: BaseClass

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        print("speaker on")
    }
 }

class Bicycle: Vehicle {
    var hasBasket = false
}

var bicycle = Bicycle()
bicycle.currentSpeed
bicycle.currentSpeed = 15.0
bicycle.currentSpeed

//오버라이딩(재정의?)

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise() //필요에 따라 슈퍼클래스의 것도 쓰고싶을 때.
        print("choo choo")
    }
}

let train = Train()
train.makeNoise()

//프로퍼티 오버라이딩; 프로퍼티 자체를 재정의 하는 것이 아니라 프로퍼티의 getter, setter, 옵저버를 재정의함을 의미함.

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
        
}

let car = Car()
car.currentSpeed = 30.0
car.gear = 2
print(car.description)

//추가로, 계산 프로퍼티, 저장프로퍼티를 오버라이드한 프로퍼티는 게터, 세터를 가질 수 잇고, 자식 클래스에서 재정의하려는 프로퍼티는 슈퍼클래스의 프로퍼티 이름과 타입이 일치해야함.
//슈퍼클래스에서 읽기,쓰기였을 때, 자식클래스에서 읽기 전용만 하는 것은 불가.
//반대로 슈퍼클래스에서 읽기 전용이였을 때, 자식클래스에서 읽기, 쓰기하는 것은 가능.

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automatic = AutomaticCar()
//생각해보니까 얘도 let선언인데 프로퍼티값 바꿀 수 있네.
automatic.currentSpeed = 35.0
automatic.description
print("AutomaticCar: \(automatic.description)")

//상속된 프로퍼티의 오버라이드를 사용할 때, 상수저장프로퍼티나 읽기전용 연산프로퍼티는 프로퍼티 옵저버를 추가할 수 없음. 상수저장프로퍼티나 읽기전용프로퍼티는 값을 설정할 수 없기에 willSet, didSet을 못 쓰는 것.

//프로퍼티나 메서드 키워드 앞에 final을 적게 되면 오버라이드 할 수 없게 됨. 클래스 앞에도 사용하면 그 클래스는 상속이 안됨.

//타입캐스팅
//인스턴스의 타입을 확인하거나 어떠한 클래스의 인스턴스를 해당 클래스 계층 구조의 슈퍼클래스나 서브클래스로 취급하는 방법.
//is, as

class MediaItem { //부모클래스; 슈퍼클래스
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) { //슈퍼클래스의 프로퍼티도 매개변수로 입력해줌.
        self.director = director
        super.init(name: name) //슈퍼클래스의 생성자(이니셜라이저)를 가져옴.
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) { //슈퍼클래스의 프로퍼티도 매개변수로 입력해줌.
        self.artist = artist
        super.init(name: name) //슈퍼클래스의 생성자(이니셜라이저)를 가져옴.
    }
}

let library = [
    Movie(name: "기생충", director: "봉준호"),
    Song(name: "Butter", artist: "BTS"),
    Movie(name: "올드보이", director: "박찬욱"),
    Song(name: "Wonderwall", artist: "Oasis"),
    Song(name: "Rain", artist: "이적")
]
//여기서 Movie와 Song은 다른 타입 아닌가? 하는 의문이 들 수 있는데 library의 타입을 확인해보면 MediaItem인 것을 볼 수 있다. 이는 Movie, Song의 슈퍼클래스로서 둘 다 표현할 수 있다.

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie { //is를 사용하여 타입을 확인.
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

//다운캐스팅; 형 변환
//특정클래스 타입의 상수 또는 변수는 하위클래스의 인스턴스를 참조할 수 있음.
//아래 예시처럼 MediaItem의 변수인 library는 subclass인 Movie, Song을 참조할 수 있음.
for item in library {
    if let movie = item as? Movie { //다운캐스팅을 실패할 수도 있기 때문에 옵셔널 사용. as? or as!
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song { //해당인스턴스가 Song class로 다운캐스팅될 수 있으면 실행됨.
        print("Song: \(song.name), by \(song.artist)")
    }
}

//assert와 guard
/* assert
 file:///Users/jason/Documents/playground/FastCampus.playground: error: Playground execution aborted: error: Execution was interrupted, reason: EXC_BREAKPOINT (code=1, subcode=0x18f4939c0).
 The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.

 - 특정 조건을 체크하고, 조건 성립 안될 시에 에러와 함께 메세지를 출력하게 할 수 있는 함수.
 - assert함수는 디버깅 모드에서만 동작하고 주로 디버깅 중 조건의 검증을 위해 사용함.
 */
/* guard 문
 - 뭔가를 검사하여 그 다음에 오는 코드를 실행할지 말지 결정하는 것.
 - guard 문에 주어진 조건문이 거짓일 때 구문이 실행됨.
 */

//var values = 0
//assert(values == 0)
//
//values = 2
//assert(values == 0, "값이 0이 아닙니다.") //주로 디버깅 중 조건의 검증을 위해 사용.

//guard문은 보통 잘못된 값이 함수에 들어오는 것을 방어.
/*
 guard 조건 else {
    return or throw or break 를 통해 이 후 코드를 실행하지 않도록 한다.
 }
 */

func guardTest(value: Int) {
    guard value == 0 else { return } //조건이 맞지않으면 그대로 종료함.
    print("안녕하세요")
}

guardTest(value: 0)

func optionalGuardTest(value: Int?) {
    guard let value = value else { return }
    print(value)
}

optionalGuardTest(value: 2) //guard let구문을 통해 옵셔널이 벗겨짐.
optionalGuardTest(value: nil) //아무것도 출력 안됨. 오류는 안남. 옵셔널 바인딩 시도한 것뿐이니까.

//프로토콜
//특정 역할, 기능을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등을 가진 틀? 청사진.

protocol OnePiece {
    var name: Int { get set } //set도 필수로 가져야 함. let 선언으로는 못받음.
    var age: Int { get } //모든 종류의 프로퍼티 설정가능.
}

protocol Pirate {
    static var someTypeProperty : Int { get set }  // 타입프로퍼티를 요구할 때.
}

protocol StrawHatPirates: OnePiece, Pirate {
    var fullName: String { get set }
    func printFullName()
}

struct Charater: StrawHatPirates {
    var fullName: String //fullName이 읽기,쓰기 다 되어야하기에 var로 선언해야함.
    static var someTypeProperty: Int = 0
    var name: Int
    let age: Int
    func printFullName() {
        print(fullName)
    }
}

protocol SomeProtocol {
    func someMethod()
}

protocol SomeProtocol2 {
    init(someParameter: Int) //몸통은 작성할 필요없고, 생성자 키워드와 매개변수만 작성해주면됨.
}

protocol SomeProtocol3 {
    init()
}
/*
 class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
 
 }
 */

//프로토콜을 정의할 땐 저장프로퍼티인지 연산프로퍼티인지 안 정하고, 단순히 프로퍼티 이름과 타입만 정의해줌. + getter, setter

class NewClass: SomeProtocol3 {
    required init() { // 구조체에서는 생성자 요구사항 준수할 때 required 필요없지만, 클래스에서는 써줘야 함.
                      // 만약 클래스 자체가 final class라면 안 붙여줘도 됨.
         
    }
}

//익스텐션
//기존의 클래스, 구조체, 열거형, 프로토콜에 새로운 기능을 추가하는 기능.
//기존에 있던 기능을 override할 수는 없다!
/* <익스텐션이 타입에 추가할 수 있는 기능>
 1) 연산 타입 프로퍼티/연산 인스턴스 프로퍼티   ; 저장프로퍼티는 불가능. 타입에 정의되있는 기존의 프로퍼티에 감시자 추가는 불가능.
 2) 타입 메서드/인스턴스 메서드
 3) 이니셜라이저
 4) 서브스크립트
 5) 중첩 타입
 6) 특정 프로토콜을 준수할 수 있도록 기능 추가
 */

extension Int {
    var isEven: Bool {
        return self % 2 == 0 // 불리언 타입이기에 반환값이 참이면 트루, 거짓이면 false를 출력함.
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    } //우리가 받을 값은 self(인스턴스객체)에 입력되는 값이기에 self만 쓰는 것임.
}

var numbersss: Int = 3
numbersss.isOdd
numbersss.isEven

extension String {
    func convertToInt() -> Int? { //"123" 같은 문자열은 전환이 되지만, "hello" 같은 문자열은 바뀔 수 없기에, 옵셔널로                           대비하는 것임.
        return Int(self)
    }
}

var strings = "0"
strings.convertToInt() //Optional(0)

//열거형
//연관성이 있는 값을 모아 놓은 것을 말함.
enum TowerOfGod: String {
    case fug = "퍼그"  //각 항목은 그 자체가 고유값. 변수 및 상수에 할당이 가능.
    case tenClans = "10가문"
    case zahard = "자하드군"
    case wolhaiksong = "월하익송" //열거형의 각 항목은 자체로도 하나의 값이지만, 항목에 원시값을 가지게 할 수도 있음. 특정 타입으로 지정된 값을 가질 수 있다는 뜻. 원시값을 가져올 때는 rawValue라는 키워드를 사용하면된다.
}

var belong = TowerOfGod.fug
belong = .zahard //이미 TowerOfGod 타입을 가진다는 것을 알기에 .만 찍고 case바꿀 수 있음.
//열거형은 switch구문과 함께쓰면 다양하게 활용이 가능.

switch belong {
case .fug:
    print("퍼그라.. 나와 뜻이 맞는군. \(belong.rawValue)")
case .tenClans:
    print("귀하신 분이 여긴 무슨 일로? \(belong.rawValue)")
case .zahard:
    print("자하드의 개들인가. \(belong.rawValue)")
case .wolhaiksong:
    print("탑에 변화를 가져오는 자들이구나. \(belong.rawValue)")
}

//원시값을 가지고 열거형 case를 반환하게 할 수도 있음.
let belong2 = TowerOfGod(rawValue: "자하드군") //case zahard

//열거형은 연관값도 가질 수 있음.

enum Rank {
    case pentaminum
    case enryu(String)
    case zahard
    case urekMazino
    case arieHorn
    case koonEdan
}

let master = Rank.enryu("탑 최고의 미남")

//연관값 추출
switch master {
case .enryu(let introduce): //연관값을 넘겨받을 수 있도록 상수를 선언. (값 바인딩)
    print(introduce)
default:
    print("관심없음")
}


//옵셔널 체이닝
//옵셔널에 속해 있는 nil일지도 모르는 프로퍼티, 메서드, 서브스크립션 등을 가져오거나 호출할 때 사용할 수 있는 일련의 과정.
struct Ranker {
    let name: String
}

struct Fug {
    let name: String
    var member: Ranker?  //아직 Fug라는 집단에 멤버가 없을 수도 있으니.
}

var newMember = Ranker(name: "Joker")
var fug = Fug(name: "For Unforgetable Grace", member: newMember)
print(fug.member) //Fug의 member 프로퍼티는 옵셔널타입으로 선언했으니 옵셔널 값으로 출력됨.
//print(fug.member.name) //error: name에 접근하기 전에 member의 옵셔널을 해제해야합니다.
print(fug.member?.name) //nil이 있을수도 있을 때의 옵셔널 체이닝. 옵셔널 값으로 반환됨. 이는 옵셔널 바인딩으로 해제 가능
print(fug.member!.name) //nil이 아닐거란 확신이 있을 때.

//에러처리; try-catch
//프로그램 내에서 에러가 발생한 상황에 대해 대응하고 이를 복구하는 과정.
//스위프트에서는 런타임에 에러가 발생한 경우 이를 처리하기 위한 발생(throwing), 감지(catching), 전파(propagating), 조작(manipulatings)을 지원하는 일급 클래스를 제공.

//스위프트에서 에러는 에러 프로토콜을 따르는 타입의 값으로 표현됨.
//에러 프로토콜은 요구사항이 없는 빈 프로토콜이지만, 오류를 표현하기 위해서는 이 프로토콜을 채택해야함.
//스위프트의 열거형은 오류원인을 나누고, 해당 오류의 특성에 대한 추가정보를 전달하는 모델을 만드는 데 적합함.
enum PhoneError: Error {
    case unknown
    case batteryLow(batteryLevel: Int) //배터리가 얼마 남았는지에 대해 말해주는 연관값 지정.
}

//throw PhoneError.batteryLow(batteryLevel: 20) //에러 발생시키는 throw구문.

//던져진 오류를 처리하기 위한 코드도 작성해야 함.

//함수에서 발생한 오류를 해당함수를 호출한 코드에 전달하는 방법
//throws로 표현된 함수를 throwing함수라 함.                    반환값이 있을 땐 throws뒤에 작성하면 됨.
func checkPhoneBatteryStatus(batteryLevel: Int) throws -> String {
                                        //throwing함수는 함수 내부에서 throw된 오류를 함수가 호출된 곳으로 전파함.
    guard batteryLevel != -1 else { throw PhoneError.unknown } //조건부합안할시에 오류를 던지기.
    guard batteryLevel > 20 else { throw PhoneError.batteryLow(batteryLevel: 20)}
    return "배터리 상태가 정상입니다." //위의 두 개의 guard문에서 잘 통과해야 정상적으로 return된다.
}
// 위의 메소드를 사용할 때, 오류가 발생될 수도 있기 때문에, do-catch나 try?, try!를 사용해서 오류를 처리할 수 있어야 함.

//첫번째 방법.
/*
 do {
  try 오류 발생 가능코드
 } catch 오류 패턴 {
  처리 코드
 }
 */
do {
    try checkPhoneBatteryStatus(batteryLevel: 20)
} catch PhoneError.unknown {
    print("알 수 없는 에러입니다.")
} catch PhoneError.batteryLow(let batteryLevl) {
    print("배터리 전원 부족 남은 배터리: \(batteryLevl)")
} catch {
    print("그 외 오류 발생: \(error)")
}

//두번째 방법
//try? 를 사용하면 오류를 옵셔널 값으로 변환하여 사용할 수 있음.
let status = try? checkPhoneBatteryStatus(batteryLevel: 21)
print(status) //오류가 발생되면 nil값을 출력. 오류 없을 시 옵셔널로 포장된 반환값 출력

//세번째 방법
//try!
let status2 = try! checkPhoneBatteryStatus(batteryLevel: 30)
print(status2) //오류가 없을 거라는 확신이 있을 때!

//클로저
//참조타입이고, 코드에서 전달 및 사용할 수 있는 독립 기능 블록이며, 일급객체의 역할을 할 수 있음.
//전달 인자로 보낼 수 있고, 변수/상수 등으로 저장하거나 전달할 수 있으며, 함수의 반환 값이 될 수도 있다.
//보통 클로저를 익명 함수라고 함. 이름이 없기에 func을 쓰지 않음.
/*
 { (매개 변수) -> 리턴 타입 in //클로저 헤드 in
    실행 구문                //클로저 바디
 }
 */
//매개변수와 리턴타입이 없는 클로저 생성.
let noParameterAndNoReturnTypeClosure = { () -> () in
    print("hello")
}

noParameterAndNoReturnTypeClosure()

//매개변수와 리턴타입이 있는 클로저 생성.
let closure = { (name: String) -> String in
    return "Hello, \(name)"
}
//주의: 클로저에서는 전달인자 레이블을 사용하지 않음.
//closure(name: "yo") error: 전달인자 레이블을 써주면 안됨.
closure("hyeonsoo")

//클로저를 함수의 parameter로도 전달할 수 있음. 일급객체니까!
//매개변수 타입이 클로저이고, 반환값이 없는 함수.
func doSomething(closure: () -> ()) {
    closure()
}

//값으로 매개변수와 반환값이 없는 클로저를 받음.
doSomething(closure: { () -> () in
    print("hello")
})

//후행 클로저 사용.
//함수 소괄호 안에서 꺼내올 수 있음.(이 함수처럼 매개변수가 클로저 하나인 경우 소괄호도 생략 가능.) 매개변수 이름 생략.
//또한 함수 정의에서 파라미터와 반환값이 모두 없는 클로저로 전달받은 것이니 클로저를 정의할 때 모두 생략가능. in 키워드도 생략 가능.
doSomething {
    print("hello2")
}

//매개변수가 없고, '파라미터와 반환값이 없는 클로저'를 반환타입으로 받는 함수.
func doSomething2() -> () -> () {
    return { () -> () in
        print("hello4")
    }
}

//func doSomething2() -> () -> String {
//    return { () ->String in
//        return "hello4"
//    }
//}

doSomething2()() //이거 왜 이렇게 쓰는지를 모르겠다!!!!!!!!!! ><
//괄호를 한 번만 쓴거는 저 클로저를 반환만 한 것임.
//두번 써줘야 클로저 안에 있는 값까지 출력이 되는 것임.

//클로저가 조금 길어지거나, 가독성이 떨어질 때는 후행 클로저 사용 가능.
//단 후행 클로저는 맨 마지막 매개변수로 전달되는 클로저에만 사용 가능.
//그러므로 매개변수에 클로저가 여러개 있을 때는 맨 마지막 클로저만 후행 클로저 사용가능하다.
//위에서 후행클로저 했음. 위로 가보자.

//매개변수에 클로저가 많을 경우, 다중 후행 클로저 문법 사용가능.
func doSomething3(success: () -> (), fail: () -> ()) { //위 함수 이름과 같지만 스위프트는 이거 허용함.
    
}
//doSomething3 {
//    <#code#>
//} fail: {
//    <#code#>
//}

//클로저 표현을 간소화하는 법.
func doClosure(parameter: (Int, Int, Int) -> Int) {
    parameter(1,2,3)
}

doClosure(parameter: { (a,b,c) -> Int in //다 쓴 형태.
    return a+b+c
})

doClosure(parameter: { //클로저의 매개변수와 반환값 타입 및 in 생략.; 헤드부분 + in을 생략했다고~
    return $0+$1+$2
})

doClosure() { //후행클로저; 함수소괄호 밖으로 빼내기. 빼내면서 함수의 매개변수 생략.
    $0+$1+$2 //단일 리턴문일 경우만 리턴 생략가능. 프린트문이랑 같이 있으면 추론 안됨.
}

doClosure { //매개변수가 클로저 하나일 경우 소괄호도 생략이 가능.
    $0+$1+$2
}

//고차함수
//다른 함수를 전달 인자로 받거나 함수 실행의 결과를 함수로 반환하는 함수.
//map, filter, reduce
let eachPower = [1,2,3,4]
let powerUp = eachPower.map { (i) -> Int in
    return i * 2
}
let simplePowerUp = eachPower.map { $0 * 2 }

print(powerUp)
print(simplePowerUp)

//filter
let randomNumbers = [34,12,45,24,7]
let filtering = randomNumbers.filter { $0 > 30 }

print(filtering)

//reduce
let reduceArray = [1,2,3,4,5]       //초깃값 0, 후행클로저
let reduceResult = reduceArray.reduce(0) {
    (result: Int, element: Int) -> Int in
    print("\(result) + \(element)")
    return result + element
}

print(reduceResult)


let someSomeArray = [1,2,3,4,5]
func totalHighFunction(_ someList: [Int] ) {
    let a = someList.map { $0 * 2 }
    let b = a.filter { $0 > 5 }
    let c = b.reduce(0) {
        (result: Int, element: Int) -> Int in
        return result + element
    }
    print(c)
}

totalHighFunction(someSomeArray)
