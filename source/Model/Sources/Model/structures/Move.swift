//
//  Move.swift
//
//
//  Created by etudiant on 1/21/24.
//

import Foundation

public struct Move : Equatable, CustomStringConvertible{
    public var owner : Owner
    public let fromRow: Int
    public let fromColumn: Int
    public let toRow: Int
    public let toColumn: Int
    
     public init?(owner: Owner, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) {
        guard owner != .noOne else{
            return nil
        }
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
