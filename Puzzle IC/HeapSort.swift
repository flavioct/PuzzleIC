//
//  HeapSort.swift
//  Puzzle IC
//
//  Created by Flávio Tabosa on 19/05/17.
//  Copyright © 2017 Flávio Tabosa. All rights reserved.
//

extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: (elements.count - 1), through: 1, by: -1) {
            swap(&elements[0], &elements[i])
            shiftDown(index: 0, heapSize: i)
        }
        return elements
    }
}

/*
 Sorts an array using a heap.
 Heapsort can be performed in-place, but it is not a stable sort.
 */
public func heapsort<T>(a: [T], _ sort: @escaping (T, T) -> Bool) -> [T] {
    let reverseOrder = { i1, i2 in sort(i2, i1) }
    var h = Heap(array: a, sort: reverseOrder)
    return h.sort()
}
