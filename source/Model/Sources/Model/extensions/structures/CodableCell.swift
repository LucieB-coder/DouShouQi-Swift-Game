//
//  CodableCell.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation
import Model

extension Cell : Codable {
    private enum CodingKeys: String, CodingKey {
        case cellType
        case initialOwner
        case piece
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let cellType: CellType = try container.decode(CellType.self, forKey: .cellType)
        let initialOwner: Owner? = try container.decodeIfPresent(Owner.self, forKey: .initialOwner)
        let piece: Piece? = try container.decodeIfPresent(Piece.self, forKey: .piece)
        if initialOwner != nil {
            self.init(cellType: cellType, initialOwner: initialOwner!, piece: piece)
        }
        else{
            self.init(cellType: cellType, piece: piece)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cellType, forKey: .cellType)
        try container.encode(initialOwner, forKey: .initialOwner)
        try container.encode(piece, forKey: .piece)
    }
}
