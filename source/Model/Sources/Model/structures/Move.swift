//
//  Move.swift
//
//
//  Created by etudiant on 1/21/24.
//

import Foundation

public struct Move {
    public let fromCell: Cell
    public let toCell: Cell
    
    init(fromCell: Cell, toCell: Cell) {
        self.fromCell = fromCell
        self.toCell = toCell
    }
}
