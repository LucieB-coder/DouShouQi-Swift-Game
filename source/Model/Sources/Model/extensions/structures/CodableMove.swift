//
//  CodableMove.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation
import Model

extension Move : Codable {
    private enum CodingKeys: String, CodingKey {
        case owner
        case fromRow
        case fromColumn
        case toRow
        case toColumn
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let owner : Owner = try container.decode(Owner.self, forKey: .owner)
        let fromRow : Int = try container.decode(Int.self, forKey: .fromRow)
        let fromColumn : Int = try container.decode(Int.self, forKey: .fromColumn)
        let toRow : Int = try container.decode(Int.self, forKey: .toRow)
        let toColumn : Int = try container.decode(Int.self, forKey: .toColumn)
        self.init(owner: owner, fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn)!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(owner, forKey: .owner)
        try container.encode(fromRow, forKey: .fromRow)
        try container.encode(fromColumn, forKey: .fromColumn)
        try container.encode(toRow, forKey: .toRow)
        try container.encode(toColumn, forKey: .toColumn)
    }
}
