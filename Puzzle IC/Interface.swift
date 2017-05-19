//
//  Interface.swift
//  Puzzle IC
//
//  Created by Flávio Tabosa on 19/05/17.
//  Copyright © 2017 Flávio Tabosa. All rights reserved.
//

import Foundation

func setup() -> () {
    ///Carrega a tabela inicial
    print("Insira os numeros de 0..8 em qualquer seguencia: ", terminator:"")
    Reading:
        if let userInput = readLine(strippingNewline: true) {
        let stringMatrix = userInput.characters.map { String($0) }
        if stringMatrix.count != 9 {
            print("Você deve inserir 9 numeros")
            break Reading
        }
        var index = 0
        for i in 0..<3 {
            for j in 0..<3 {
                if var c = Int(stringMatrix[index]) {
                    if c == 8 {
                        firstGMatrix[i][j] = 0
                    } else if c == 0 {
                        firstGMatrix[i][j] = 8
                    } else {
                        firstGMatrix[i][j] = c
                    }
                    
                    index += 1
                } else {
                    print("Insira somente numeros")
                    break Reading
                }
            }
        }
        
    } else {
        print("Erro na leitura")
    }
    var index = 0
    for i in 0..<3 {
        for j in 0..<3 {
            
            if index == 8 {
                finalGMatrix[i][j] = 0
            } else if index == 0 {
                finalGMatrix[i][j] = 8
            } else {
                finalGMatrix[i][j] = index
            }
            index += 1
        }
    }
}

func hasSolution(_ initialMatrix: [[Int]], finalMatrix: [[Int]]) -> Bool {
    var initialMatrixParity = 0
    var finalMatrixParity = 0
    for i in 0..<3 {
        for j in 0..<3 {
            let value = initialMatrix[i][j]
            for p in i..<3 {
                for q in 0..<3 {
                    let nextValue = initialMatrix[p][q]
                    if (nextValue < value) && (nextValue != 0) && ( p > i || q > j ) {
                        initialMatrixParity+=1
                    }
                }
            }
        }
    }
    for i in 0..<3 {
        for j in 0..<3 {
            let value = finalMatrix[i][j]
            
            for p in i..<3 {
                for q in 0..<3 {
                    let nextValue = finalMatrix[p][q]
                    
                    if (nextValue < value) && (nextValue != 0) && ( p > i || q > j ) {
                        finalMatrixParity+=1
                    }
                }
            }
        }
    }
    
    return initialMatrixParity%2 == finalMatrixParity%2
    
}

