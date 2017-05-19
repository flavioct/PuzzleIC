//
//  main.swift
//  Puzzle IC
//
//  Created by Flávio Tabosa on 19/05/17.
//  Copyright © 2017 Flávio Tabosa. All rights reserved.
//

import Foundation

var firstGMatrix = Array(repeating: Array(repeating: 0, count: 3), count: 3)
var finalGMatrix = Array(repeating: Array(repeating: 0, count: 3), count: 3)

setup()
var visitedCMatrixs = Set<CMatrix>()
var globalI = 0
var globalJ = 0
for i in 0..<3 {
    for j in 0..<3 {
        if firstGMatrix[i][j] == 0 {
            globalI = i
            globalJ = j
        }
    }
}


let firstCMatrix = CMatrix(
    matrix: firstGMatrix,
    parent: nil,
    move: nil,
    depth: 0,
    cost: 0,
    emptyX: globalI,
    emptyY: globalJ
)


globalI = 0
globalJ = 0


for i in 0..<3 {
    for j in 0..<3 {
        if finalGMatrix[i][j] == 0 {
            globalI=i
            globalJ=j
        }
    }
}


let finalCMatrix = CMatrix(
    matrix: finalGMatrix,
    parent: nil,
    move: nil,
    depth: 0,
    cost: 0,
    emptyX: globalI,
    emptyY: globalJ
)

print("\n Matriz inserida \n")
firstCMatrix.printMatrix()

var passedByNodes = 0
var generatedNodes = 0

if hasSolution(firstGMatrix, finalMatrix: finalGMatrix) {
    let answer = aStarSearch()
    print("\n Número de moviventos: \(answer.depth)")
    
    answer.printPath()
    
    print("")
} else {
    print("Nao ha solução para essa Matriz")
}
