//
//  Cell.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Cell : CustomStringConvertible {
    public let cellType: CellType
    public let initialOwner : Owner
    public let piece : Piece?
    
    public var description : String {
        "\(self.piece?.description ?? "ø") on \(self.cellType), \(self.initialOwner.description)"
    }
    
    public init(cellType: CellType, initialOwner: Owner = .noOne, piece: Piece? = nil) {
        self.cellType = cellType
        self.initialOwner = initialOwner
        self.piece = piece
    }
}
