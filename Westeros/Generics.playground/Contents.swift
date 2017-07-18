//: Generics

// Son templates de código que se completan en tiempo de compilación

/*
    4 tipos:
        - Funciones genéricas
        - Clases genéricas
        - Estructuras & Enums genéricas
        - Protocolos genéricos: se implementan de forma distinta a los demás
 */


// Funciones

func swapInt(a: inout Int, b: inout Int) {
    let aux = a
    a = b
    b = aux
}

var a = 3
var b = 2

swapInt(a: &a, b: &b)

func swapAny<A>(a: inout A, b: inout A) {
    let aux = a
    a = b
    b = aux
}

swapAny(a: &a, b: &b)

var s1 = "Hola"
var s2 = "Adios"

swapAny(a: &s1, b: &s2)
(s1,s2)

// Estructuras de datos genéricas: Class, Struct y Enum

struct Pair<First, Second> {
    let first : First
    let second: Second
}

let pair = Pair(first: 20, second: ["GHo","Hgo")
pair.first
pair.second

// Poner restricciones a los tipos genéricos

// Key solo puede aceptar como valor un argumento que implemente Hashable
struct HashPair<Value, Key : Hashable> {
    let value : Value
    let key : Key
}

// Mezcla de genérico y tipo específico
struct MixedPair<T> {
    let head : Int
    let tail : T
}

// Protocolos genéricos
// En de una variable de tipo(Genérica) usa un "tipo asociado"
protocol Bar{
    associatedtype Element
}





