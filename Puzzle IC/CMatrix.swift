//
//  CMatrix.swift
//  Puzzle IC
//
//  Created by Flávio Tabosa on 19/05/17.
//  Copyright © 2017 Flávio Tabosa. All rights reserved.
//

import Foundation

class CMatrix {
    let matrix: [[Int]]
    let parent: CMatrix?
    let move: String?
    let depth: Int
    let cost: Int
    let emptyX: Int
    let emptyY: Int
    var nodeArray: Array<CMatrix>
    
    init(matrix: [[Int]], parent: CMatrix?, move: String?, depth: Int, cost: Int, emptyX: Int, emptyY: Int) {
        self.matrix = matrix
        self.depth = depth
        self.move = move
        self.parent = parent
        self.emptyX = emptyX
        self.emptyY = emptyY
        self.cost = cost
        nodeArray = []
    }
    
    func printPath() {
        var nodeToPrint: CMatrix? = self
        while nodeToPrint != nil {
            nodeArray.append(nodeToPrint!)
            nodeToPrint = nodeToPrint!.parent
        }
        nodeArray = nodeArray.reversed()
        for node in nodeArray {
            print("")
            node.printMatrix()
            //            if let move = node.move {
            //                print(" Movimento para \(move)")
            //            }
        }
    }
    
    func printMatrix() {
        for i in 0..<3 {
            print("    ", terminator:"")
            for j in 0..<2 {
                if matrix[i][j] == 8 {
                    print("0", terminator:" ")
                }else if matrix[i][j] == 0 {
                    print(" ", terminator: " ")
                } else {
                    print(matrix[i][j], terminator:" ")
                }
            }
            if matrix[i][2] == 8 {
                print("0", terminator: "\n")
            } else if matrix[i][2] == 0 {
                print("X", terminator: "\n")
            }else {
                print(matrix[i][2], terminator: "\n")
            }
        }
    }
}



func matrixAndDepthEquality (_ lhs: CMatrix, rhs: CMatrix) -> Bool {
    return lhs.matrix == rhs.matrix && lhs.depth == rhs.depth
}

extension CMatrix: CustomStringConvertible {
    var description: String {
        return "{ Matriz:  \(matrix) } "
    }
}

extension CMatrix: Hashable {
    var hashValue: Int {
        return description.hashValue
    }
}

extension CMatrix: Equatable {}
func == (lhs: CMatrix, rhs: CMatrix) -> Bool {
    return lhs.matrix == rhs.matrix
}

func == (lefths: [[Int]], righths: [[Int]]) -> Bool{
    if lefths.count != righths.count{
        return false
    }
    let count = lefths.count
    for i in 0..<count{
        if lefths[i] != righths[i] {
            return false
        }
    }
    
    return true
}
