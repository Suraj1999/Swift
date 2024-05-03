import Cocoa

var greeting = "Hello, playground"

// Collections in swift - Organize data using arrays, sets and dictionaries.
     
     // Arrays - Ordered collection of values of similar type
     // Sets -   Unordered and unique collection of values. Conform to hashable type
     // Dictionaries - Unordered collection of key-value associations.Keys conform to hashable type.


// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// ARRAYS


// Declare empty arrays
var ints = [Int]()
var someInts: [Int] = []

ints.append(1)
ints += [2,3,4,5]
print(ints) // [1, 2, 3, 4, 5]
ints.contains(1) // true

ints.first // Return a first element of an array of optional type.
ints.last // Return the last element of an array of optional type.

// Creating array with defualt value :

var threeDouble = Array(repeating: 0.0, count: 3)

print(threeDouble) // [0.0, 0.0, 0.0]
threeDouble.append(2)
threeDouble // [0.0, 0.0, 0.0, 2.0]

threeDouble += [3,4,5]
threeDouble // [0.0, 0.0, 0.0, 2.0, 3.0, 4.0, 5.0]

print(threeDouble.removeFirst()) // remove first element of an array and returns first element
threeDouble // [0.0, 0.0, 2.0, 3.0, 4.0, 5.0]

threeDouble.popLast() // remove the last element of an array and return last element if exist. It return the last element and if empty returns nil
threeDouble  // [0.0, 0.0, 2.0, 3.0, 4.0]

var newArray = threeDouble.dropLast(2) // arrays remain same after this only last element is selected and can be assigned to new variable. dropLast() is immutable
newArray // new array is created after dropping last 2 elemnts. Here slicing is done. // [0.0, 0.0, 2.0]
threeDouble // [0.0, 0.0, 2.0, 3.0, 4.0]

threeDouble.removeLast() // mutable as it mutates the original array. Its return type is void
threeDouble // [0.0, 0.0, 2.0, 3.0]

var arr = [1,2,3,4,5]
arr.insert(0, at: 0)
arr             // [0,1,2,3,4,5]

arr.insert(6, at: arr.count) // you can insert new element either at existing index or the index which is next to be filled that is next index to the last. works like append
arr    // [0,1,2,3,4,5,6]

arr.remove(at: 0)
arr       //  [1,2,3,4,5,6]

arr.removeAll() // []
arr  // []

var num = [5,1,2,4,3,7]
num.sort() // mutable method which sorts the original array.
num // [1,2,3,4,5,7]

var num1 = [5,1,2,4,3,7]
var sortedArr = num1.sorted()
sortedArr // a new sorted array is creted [1,2,3,4,5,7]
print(num1) // remains same  [5, 1, 2, 4, 3, 7]

var basket = Array<String>()
basket.append("apple")
basket += ["mango", "banana", "pineapple"]
basket  // ["apple","mango", "banana", "pineapple"]

// access each element in basket
for fruit in basket {
    print(fruit)
}

// access index and value of each element by using enumerated()
for (index, value) in basket.enumerated() {
    print("\(index + 1): \(value)")
}

// only when you want to access an index of an array use indices
for index in basket.indices {
    print("\(index) contains \(basket[index])")
}

// accessing element in each array using for-each
basket.forEach { fruit in
    print(fruit)
}

var str1 = ["Hello","How"]
var str2 = ["are", "you"]

str1.append(contentsOf: str2) // append both the array to str1
print(str1) // ["Hello", "How", "are", "you"]



// -------------------------------------------------------------------------------------------------------------------------------------------------------------------//



// SETS

var letter = Set<Character>()
letter.insert("a")
letter.insert("b")
print(letter)   // ["b", "a"]

letter.remove("a") // Optional("a") it returns optinal value.
letter.removeAll() // this is used to empty all elements in a set.
letter = [] // this is used to empty all elements in a set.


// Creating set with array literal

var songs: Set<String> = ["Rock", "Jazz", "Classic"]
songs // ["Jazz", "Classic", "Rock"]

// Another way using type inference:

var songType: Set = ["Rock", "Classic", "Jazz"]
songType // ["Rock" ,"Jazz", "Classic"]
songType.count // 3
songType.isEmpty // false
songType.insert("Rockzzz")
songType
songType.count // 4

if let removeSong = songType.remove("Rockzzz") {
    print(removeSong)
} else {
    print("not present")
}
songType.count // 3

songType.contains("Jazz") // true

// Iterating each songs

for genre in songType {
    print(genre)         // Rock, Classic, Jazz
}

for genre in songType.sorted() {
    print(genre)         // Classic, Jazz, Rock
}


// Set operations:

let odd: Set = [1, 3, 5, 7, 9]
let even: Set = [0, 2, 4, 6, 8]
let prime: Set = [2,3,5,7]

odd.union(even) // [2,3,4,5,0,9,6,7,8,1] but not in this order
odd // [5, 1, 3, 7, 9]

odd.union(even).sorted() // [0,1,2,3,4,5,6,7,8,9]
odd // [5, 1, 3, 7, 9]

odd.intersection(even) // []

odd.subtracting(prime).sorted() // [1,9]

odd.symmetricDifference(prime).sorted() // [1,2,9]

// odd.isSubset(of: <#T##Sequence#>)
// odd.isSuperset(of: <#T##Sequence#>)
// odd.isDisjoint(with: <#T##Sequence#>)
// odd.isStrictSubset(of: <#T##Sequence#>)
// odd.isStrictSuperset(of: <#T##Sequence#>)


// ----------------------------------------------------------------------------------------------------------------------------------------------------------//

// Dictionaries

var dict: [Int: String] = [1: "one", 2: "two", 3: "three"]
dict // [ 2: "two", 1: "one",3: "three"]

// how to add new key value pair

dict[4] = "Four"
dict    // [ 4: "Four", 2: "two", 1: "one",3: "three"]



// How to replace key with a new value

dict[2] = "twoo"
dict  // [ 4: "Four", 2: "twoo", 1: "one",3: "three"]

if let oldVal = dict.updateValue("two", forKey: 2) {   // it returns an optinal value that is why we need to unwrap it
    print(oldVal)
} else {
    print("no value found")
}

dict // // [ 4: "Four", 2: "two", 1: "one",3: "three"]



// How to remove element of a dictionary

dict[1] = nil
dict // [ 4: "Four", 2: "two", 3: "three"]

print(dict[2]) // Optional("two") because the key does not exist in reality that is why it is optional
print(dict[2,default: "not exist key"]) // two

print(dict.removeValue(forKey: 2)) // Optional("two")

dict // [4: "Four", 3: "three"]

if let deleteVal = dict.removeValue(forKey: 3) {
    print(deleteVal)
} else {
    print("key does not exist")
}

dict.count // 1
dict.removeAll()
dict.isEmpty  // true


// Iterating over dictionary

let newDict = [ 4: "Four", 2: "two", 1: "one",3: "three"]

for (key, value) in newDict {
    print("\(key) contains \(value)")
}

for index in newDict.keys {
    print(index)
}

for index in newDict.keys.sorted() {
    print(index)
}


for value in newDict.values {
    print(value)
}

for value in newDict.values.sorted() {  // according to alphabetical sorting way
    print(value )
}


let ind = [Int](newDict.keys)
ind  // [1, 2, 3, 4]

let val = [String](newDict.values)
val // ["one", "three", "two", "four"]
