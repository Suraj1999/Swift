import Cocoa

var greeting = "Hello, playground"



var numbers: [Int] = [1, 2, 3, 4, 5]
var tempArray: [Int] = []

for number in numbers {
    tempArray.append(number * 2)
}

print(tempArray)

// Map Function
let m1 = numbers.map { num in
    num * 5
}
print(m1)

let m2 = numbers.map({ $0 * 4 })
print(m2)

let m3 = numbers.map{ $0 * 3 }
print(m3)

let str = ["Hi", "Hola", "Hello"]

let cnt = str.map{ $0.count }
print(cnt)

// --------------------------------------------------------------------------------------------------------------------------------------------------------------//

// compactMap - similar to map hai but compactMap optional and nil ko remove krta hai
let num: [Int?] = [1, nil, 2, nil, 4, 5]
let mp1 = num.map { val -> Int? in
    if let val = val {
        return val
    } else {
        return nil
    }
}

print(mp1)

// now what compactMap does is
let c = num.compactMap{( $0 == nil ? nil : $0)}
print(c)

let c1 = num.compactMap{( $0 )}
print(c1)


// This will give error bcz it contains nil value also and it cannot be multiplied by 5
/*
let cp = num.compactMap({ $0 * 5 })
print(cp)
 */

// first remove nil and optional value from array using compactMap then you will get non-optinal array and then directly map to it.
let cp1 = num.compactMap{ $0 }.map{ $0 * 5 }
print(cp1)



// --------------------------------------------------------------------------------------------------------------------------------------------------------------//

// FlatMap

var twoD: [[Int]] = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
]

print(twoD)

var tempArr: [Int] = []

for num in twoD {
    tempArr += num
}
print(tempArr)

// for first loop the num contains - [1, 2, 3] and is added to tempArr
// for second time loop the num contains - [4, 5, 6] and is added to tempArr
// for the third time loop the num contains - [7, 8, 9] and is added to tempArr
// tempArr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let t1 = twoD.flatMap{ $0 }.map{ $0 * 5 }
print(t1)


//-------------------------------------------------------------------------------------------------------------------------------------------------//

// Filter

struct IndieApp {
    let name: String
    let monthlyPrice: Double
    let users: Int
}

let portfolio = [ IndieApp(name: "view", monthlyPrice: 11.99, users: 12),
                  IndieApp(name: "FitView", monthlyPrice: 0.00, users: 1527),
                  IndieApp(name: "Buckets", monthlyPrice: 1.99, users: 7598)]

//filter
let freeApps = portfolio.filter { val in
    val.users > 500
}

print(freeApps)

let fp = portfolio.filter{ $0.monthlyPrice == 0.00 }
print(fp)

let arr = [2,3,4,5,6,7,8,9]

let evenArr = arr.filter{ $0 % 2 == 0 }
print(evenArr)


// ---------------------------------------------------------------------------------------------------------------------------------------------------//


// Reduce

let arr1 = [1, 2, 3, 4, 5]
let sum = arr1.reduce(0, +) // here 0 is the initial value
print(sum)

let sub = arr1.reduce(100, -) // here initial value is 100 and it is each value is subtracted from 100
print(sub)

let totalUsers = portfolio.reduce(0, { $0 + $1.users })
print(totalUsers)
        
