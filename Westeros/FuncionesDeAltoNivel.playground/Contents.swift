
// Funciones como valores
typealias IntToInt = (Int) -> Int

func adder(n: Int) -> IntToInt {
    func f(x: Int) -> Int {
        return x + n
    }
    return f
}

let h = adder(n: 5)
h(1)

//Funciones como parámetros de entrada
func apply(f: IntToInt, n: Int) -> Int {
    return f(n)
}

apply(f: h, n: 99)


// Sintaxis de clausuras

func f(_ n: Int) -> Int {
    return n + 1
}

let f1 = {(n: Int) in return n + 1 }

f(49)
f1(49)

// las funciones al ser tipos como cualquier otro, se pueden meter en colecciones

let functions = [f,f1,h]

for fn in functions {
    dump(fn(42))
}

// La sintaxis abreviada de clausuras

let clausuras = [f,
                 {(n:Int) in return n+1},
                 {n in return n * 3},
                 {n in n * 6},
                 {$0 + 99}]

for cl in clausuras {
    cl(34)
}

var evens = [4,10,12,8,6,2]

let papa = evens.sorted(by:{(a: Int, b: Int)  in a > b})

papa

evens.sorted { (a: Int, b: Int) -> Bool in
    return (a > b)
}


// Operaciones sobre colecciones con programación funcional
// Clásicos de FP: map, filter, flatMap

// Map: iteración para Chuck Norris
var result = [Int]()

for element in evens {
    result.append(element * 4)
}

result
evens.map { $0 * 4}

// Filter: elimina ciertos elementos de un array

result = evens.filter { $0 > 6 }

result

let instOrNil : [Int?] = [1,2,nil,4,7,nil,8,9,nil]

instOrNil.flatMap { $0?.byteSwapped }

