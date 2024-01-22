//
//  Move.swift
//
//
//  Created by etudiant on 1/21/24.
//

import Foundation

public struct Move {
    let owner : Owner
    let fromRow: Int
    let fromColumn: Int
    let toRow: Int
    let toColumn: Int
    
    init(owner: Owner, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) {
        self.owner = owner
        self.fromRow = fromRow
        self.fromColumn = fromColumn
        self.toRow = toRow
        self.toColumn = toColumn
    }
    
    public var description : String {
        "\(self.owner): [\(self.fromRow), \(self.fromColumn)] -> [\(self.toRow), \(self.toColumn)]"
    }
}
