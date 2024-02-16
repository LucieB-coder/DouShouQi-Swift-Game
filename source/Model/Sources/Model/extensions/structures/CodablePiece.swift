//
//  CodablePiece.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation
import Model

extension Piece: Codable {
    private enum CodingKeys: String, CodingKey {
        case animal
        case owner
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let owner : Owner = try container.decode(Owner.self, forKey: .owner)
        let animal: Animal = try container.decode(Animal.self, forKey: .animal)
        self.init(owner: owner, animal: animal)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(owner, forKey: .owner)
        try container.encode(animal, forKey: .animal)
    }
}

