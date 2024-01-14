//
//  Cell.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Cell {
    public let cellType: CellType
    public let initialOwner : Owner
    public let piece : Piece?
    
    public var description : String {
        "\(self.piece?.description ?? "ø") on \(self.cellType), \(self.initialOwner.rawValue)"
    }
    
    public init(cellType: CellType, initialOwner: Owner, piece: Piece?) {
        self.cellType = cellType
        self.initialOwner = initialOwner
        self.piece = piece
    }
}
