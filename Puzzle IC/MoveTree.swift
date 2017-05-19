//
//  MoveTree.swift
//  Puzzle IC
//
//  Created by Flávio Tabosa on 19/05/17.
//  Copyright © 2017 Flávio Tabosa. All rights reserved.
//

import Foundation
func aStartSort (_ lhs: CMatrix, rhs: CMatrix) -> Bool {
    
    return lhs.cost + lhs.depth  <  rhs.cost + rhs.depth
    
}

func generateChild(_ currentCMatrix: CMatrix) -> ([CMatrix]) {
    var newCMatrixs = [CMatrix]()
    
    let x = currentCMatrix.emptyX
    let y = currentCMatrix.emptyY
    if y>0 {
        var aux_matrix = currentCMatrix.matrix
        aux_matrix[x][y]=aux_matrix[x][y-1]
        aux_matrix[x][y-1]=0
        let auxCMatrix = CMatrix(matrix: aux_matrix, parent: currentCMatrix, move: "Direita", depth: currentCMatrix.depth+1, cost: getCostTo(aux_matrix),
                             emptyX: currentCMatrix.emptyX, emptyY: currentCMatrix.emptyY-1)
        newCMatrixs.append(auxCMatrix)
        generatedNodes+=1
    }
    
    if y<2 {
        var aux_matrix = currentCMatrix.matrix
        aux_matrix[x][y]=aux_matrix[x][y+1]
        aux_matrix[x][y+1]=0
        let auxCMatrix = CMatrix(matrix: aux_matrix, parent: currentCMatrix, move: "Esquerda", depth: currentCMatrix.depth+1, cost: getCostTo(aux_matrix),
                             emptyX: currentCMatrix.emptyX, emptyY: currentCMatrix.emptyY+1)
        newCMatrixs.append(auxCMatrix)
        generatedNodes+=1
    }
    if x>0 {
        var aux_matrix = currentCMatrix.matrix
        aux_matrix[x][y]=aux_matrix[x-1][y]
        aux_matrix[x-1][y]=0
        let auxCMatrix = CMatrix(matrix: aux_matrix, parent: currentCMatrix, move: "Baixo", depth: currentCMatrix.depth+1, cost: getCostTo(aux_matrix),
                             emptyX: currentCMatrix.emptyX-1, emptyY: currentCMatrix.emptyY)
        newCMatrixs.append(auxCMatrix)
        generatedNodes+=1
    }
    
    
    if x<2 {
        var aux_matrix = currentCMatrix.matrix
        aux_matrix[x][y]=aux_matrix[x+1][y]
        aux_matrix[x+1][y]=0
        let auxCMatrix = CMatrix(matrix: aux_matrix, parent: currentCMatrix, move: "Cima", depth: currentCMatrix.depth+1, cost: getCostTo(aux_matrix),
                             emptyX: currentCMatrix.emptyX+1, emptyY: currentCMatrix.emptyY)
        newCMatrixs.append(auxCMatrix)
        generatedNodes+=1
    }
    
    
    return newCMatrixs
}

func findCoordinates(_ number: Int, matrix: [[Int]]) -> (row: Int, col: Int)? {
    for i in 0..<3 {
        for j in 0..<3 {
            if matrix[i][j]==number {
                return (i,j)
            }
        }
    }
    return nil
}

func manhantanDistance(_ n:Int,currentmatrix: [[Int]] ) -> (Int)? {
    
    if let (x1,y1) = findCoordinates(n, matrix: currentmatrix), let (x2,y2) = findCoordinates(n, matrix: finalCMatrix.matrix){
        return abs(x1-x2) + abs(y1-y2)
    }
    return nil
}

func getCostTo(_ currentmatrix: [[Int]]) -> (Int) {
    
    var totalCost = 0
    
    for i in 0...8 {
        if let distance = manhantanDistance(i, currentmatrix: currentmatrix) {
            totalCost+=distance
        }
        else {
            return 0
        }
    }
    
    
    return totalCost
}

func isSolution(_ someCMatrix: CMatrix, finalCMatrix: CMatrix) -> (Bool) {
    return someCMatrix.matrix == finalCMatrix.matrix
}

func aStarSearch() -> (CMatrix){
    
    var stateList = PriorityQueue<CMatrix>(sort: aStartSort)
    stateList.enqueue(firstCMatrix)
    while !stateList.isEmpty {
        if let state = stateList.dequeue(){
            if isSolution(state, finalCMatrix: finalCMatrix) {
                return state
            }
            let childList = generateChild(state)
            for child in childList {
                if !visitedCMatrixs.contains(child) {
                    stateList.enqueue(child)
                    visitedCMatrixs.insert(child)
                    passedByNodes+=1
                    if passedByNodes % 1000 == 0 { print (passedByNodes) }
                }
            }
            
        }
        
    }
    
    return firstCMatrix
}
