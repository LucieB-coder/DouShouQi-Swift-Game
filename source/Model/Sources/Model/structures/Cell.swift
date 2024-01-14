//
//  Cell.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Cell {
    let cellType: CellType
    let initialOwner : Owner
    let piece : Piece?
    
    var description : String {
        "\(self.piece?.description ?? "ø") on \(self.cellType), \(self.initialOwner.rawValue)"
    }
    
    init(cellType: CellType, initialOwner: Owner, piece: Piece?) {
        self.cellType = cellType
        self.initialOwner = initialOwner
        self.piece = piece
    }
}
