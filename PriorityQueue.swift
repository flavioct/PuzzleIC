//
//  PriorityQueue.swift
//  Puzzle IC
//
//  Created by Flávio Tabosa on 19/05/17.
//  Copyright © 2017 Flávio Tabosa. All rights reserved.
//

public struct PriorityQueue<T> {
    fileprivate var heap: Heap<T>
    
    
    public init(sort: @escaping (T, T) -> Bool) {
        heap = Heap(sort: sort)
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public func peek() -> T? {
        return heap.peek()
    }
    
    public mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    public mutating func dequeue() -> T? {
        return heap.remove()
    }
    
    
    public mutating func changePriority(index i: Int, value: T) {
        return heap.replace(index: i, value: value)
    }
}

extension PriorityQueue where T: Equatable {
    public func index(of element: T) -> Int? {
        return heap.index(of: element)
    }
}
