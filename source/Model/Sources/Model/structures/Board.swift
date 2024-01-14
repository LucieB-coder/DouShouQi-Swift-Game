//
//  Board.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Board {
    let nbRows : Int
    let nbColumns : Int
    private(set) var grid : [[Cell]]
    
    init?(grid: [[Cell]]) {
        let rowSizes = Set(grid.map { $0.count })
        guard rowSizes.count == 1 else {
            // Rows have different sizes
            return nil
        }
        self.nbRows = grid.count
        self.nbColumns = rowSizes.first!
        self.grid = grid
    }
}

