import UIKit

func example(_ str: String, action: () -> ())   {
    print(str)
    action()
    print()
}

class DLNode    {
    var next: DLNode?
    weak var prev: DLNode?
    var value: Int
    
    init(_ value: Int) {
        self.value = value
    }
}

class DoublyLinkedList  {
    private var head: DLNode?
    private var tail: DLNode?
    
    func append(_ value: Int)   {
        let newNode = DLNode(value)
        
        // empty list
        guard let lastNode = tail else  {
            head = newNode
            tail = newNode
            return
        }
        
        // no longer empty list
        lastNode.next = newNode
        newNode.prev = lastNode
        tail = newNode
    }
    
    func printForward() {
        var currentNode = head
        while let node = currentNode    {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print("nil")
    }
    
    func printReverse() {
        var currentNode = tail
        while let node = currentNode    {
            print(node.value, terminator: " -> ")
            currentNode = node.prev
        }
        print("nil")
    }
    
    // TODO - Add node to the front
    
    // TODO - Delete Head
    
    // TODO - Delete Tail
}

let list = DoublyLinkedList()
example("testing appends") {
    list.append(10)
    list.append(7)
    list.append(5)
    list.printForward()
}

example("print reverse")    {
    list.printReverse()
}
