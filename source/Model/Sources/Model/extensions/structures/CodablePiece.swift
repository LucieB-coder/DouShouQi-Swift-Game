//
//  CodablePiece.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation

extension Piece: Codable {
    private enum CodingKeys: String, CodingKey {
        case animal
        case owner
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.owner = try container.decode(Owner.self, forKey: .owner)
        self.animal = try container.decode(Animal.self, forKey: .animal)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(owner, forKey: .owner)
        try container.encode(animal, forKey: .animal)
    }
}

