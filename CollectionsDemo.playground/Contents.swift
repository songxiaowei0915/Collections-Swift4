import Foundation

//protocol IteratorProtocol {
//    associatedtype Element
//    mutating func next() -> Element?
//}
//
//protocol Sequence {
//    associatedtype Element
//    associatedtype Iterator: IteratorProtocol where Iterator.Element == Element
//
//    func makeIterator() -> Iterator
//}

struct FiboIter: IteratorProtocol {
    private var state = (0, 1)
    
    mutating func next() -> Int? {
        let nextNumber = state.0
        self.state = (state.1, state.0 + state.1)
        
        return nextNumber
    }
}

struct Fibonacci: Sequence {
    typealias Element = Int
    
    func makeIterator() -> FiboIter {
        return FiboIter()
    }
}

var fibs = Fibonacci().makeIterator()
print(fibs.next()!)
print(fibs.next()!)
print(fibs.next()!)
print(fibs.next()!)

var fibs1 = fibs

print(fibs.next()!)
print(fibs.next()!)


print(fibs1.next()!)
print(fibs1.next()!)

var fibs2 = AnyIterator(fibs1)
var fibs3 = fibs2

print(fibs2.next()!)
print(fibs2.next()!)

print(fibs3.next()!)
print(fibs3.next()!)




