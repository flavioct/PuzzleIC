//
//  List.swift
//  Puzzle IC
//
//  Created by Flávio Tabosa on 19/05/17.
//  Copyright © 2017 Flávio Tabosa. All rights reserved.
//

import Foundation

class Node<T: Equatable> {
    var value: T? = nil
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init() {
    }
    
    init(value: T) {
        self.value = value
    }
}

import Foundation

class LinkedList<T: Equatable> {
    var count: Int = 0
    var head: Node<T> = Node<T>()
    var tail: Node<T> = Node<T>()
    
    init() {
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func addItem(_ value: T) {
        let node = Node<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.prev = self.tail
            self.tail.next = node
            self.tail = node
        }
        self.count += 1
    }
    
    
    
    func indexOf (_ itemToFind: T) -> Int{
        var index = 0
        if (self.count > 0){
            var currentNode: Node? = self.head
            while (currentNode != nil) {
                if currentNode!.value! == itemToFind{
                    return index
                }
                index += 1
                currentNode = currentNode!.next
            }
        }
        return -1
    }
    
    
    
    
    func removeLast() -> T?{
        if count == 0{
            return nil
        }
        if (count == 1){
            let value = head.value
            head = Node<T>()
            tail = Node<T>()
            self.count -= 1
            return value
        }
        let value = self.tail.value
        self.tail.prev!.next = tail.next
        self.tail = tail.prev!
        self.count -= 1
        return value
    }
    
    
    
    func add(_ value: T, position: Int){
        let node = Node<T>(value: value)
        if (self.count > position && position >= 0) {
            if (position == 0){
                node.next = self.head
                self.head.prev = node
                self.head = node
            } else {
                var currentNode = self.head
                for _ in 0...position-1 {
                    currentNode = currentNode.next!
                }
                node.next = currentNode
                node.prev = currentNode.prev
                currentNode.prev!.next = node
                currentNode.prev = node
            }
            self.count += 1
        }
    }
    
    
    func insertItem(_ value: T, position: Int){
        let node = Node<T>(value: value)
        if (self.count > position) {
            if (position == 0){
                node.next = self.head
                self.head.prev = node
                self.head = node
            } else {
                var currentNode = self.head
                for _ in 0...position-1 {
                    currentNode = currentNode.next!
                }
                node.next = currentNode
                node.prev = currentNode.prev
                currentNode.prev!.next = node
                currentNode.prev = node
            }
            self.count += 1
        }
    }
    
    func removeItem(_ position: Int) {
        if (self.count > position){
            if (self.count != 1){
                if (position == 0){
                    self.head.next!.prev = head.prev
                    self.head = head.next!
                }
                if (position == self.count-1){
                    self.tail.prev!.next = tail.next
                    self.tail = tail.prev!
                }
                if (position > 0 && position < count-1){
                    var currentNode = self.head
                    for _ in 0...position-1 {
                        currentNode = currentNode.next!
                    }
                    currentNode.next!.prev = currentNode.prev
                    currentNode.prev!.next = currentNode.next
                }
            } else {
                head = Node<T>()
                tail = Node<T>()
            }
            self.count -= 1
        }
    }
    
    func replaceItem(_ itemToReplace: T, position: Int) {
        if (self.count > position){
            var currentNode = self.head
            if (position == 0){
                currentNode.value = itemToReplace
            } else {
                for _ in 0...position-1{
                    currentNode = currentNode.next!
                }
                currentNode.value = itemToReplace
            }
        }
    }
    
    
    
    func getItemAt(_ position: Int) -> T? {
        if (self.count > position){
            var currentNode = self.head
            if (position == 0){
                return currentNode.value
            } else {
                for _ in 0...position-1{
                    currentNode = currentNode.next!
                }
                return currentNode.value
            }
        } else {
            return nil
        }
    }
    
    func printList() {
        var output: String = "["
        var currentNode: Node? = self.head
        while (currentNode != nil) {
            output += String(describing: currentNode!.value)
            currentNode = currentNode!.next
            if (currentNode != nil){
                output += ", "
            }
        }
        output += "]"
        print(output)
    }
    
    func printInverse() {
        var output: String = "["
        var currentNode: Node? = self.tail
        while (currentNode != nil) {
            output += String(describing: currentNode!.value)
            currentNode = currentNode!.prev
            if (currentNode != nil){
                output += ", "
            }
        }
        output += "]"
        print(output)
    }
    
}
