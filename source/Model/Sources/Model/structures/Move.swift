//
//  Move.swift
//
//
//  Created by etudiant on 1/21/24.
//

import Foundation

public struct Move {
    
    public let fromRow: Int
    public let fromColumn: Int
    public let toRow: Int
    public let toColumn: Int
    
    init(fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) {
        self.fromRow = fromRow
        self.fromColumn = fromColumn
        self.toRow = toRow
        self.toColumn = toColumn
    }
}
