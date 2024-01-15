//
//  Board.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Board {
    public let nbRows : Int
    public let nbColumns : Int
    private(set) public var grid : [[Cell]]
    
    
    public init?(grid: [[Cell]]) {
        let firstRowSize : Int = grid.first?.count ?? 0
        let areRowsEqualSize = grid.allSatisfy {$0.count == firstRowSize }
        guard areRowsEqualSize else {
            // Rows have different sizes
            return nil
        }
        self.nbRows = grid.count
        self.nbColumns = grid.first?.count ?? 0
        self.grid = grid
    }
}

