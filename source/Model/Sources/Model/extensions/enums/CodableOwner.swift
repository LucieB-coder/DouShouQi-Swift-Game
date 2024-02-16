//
//  CodableOwner.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation
import Model

extension Owner : Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .player1: try container.encode("player1")
        case .player2: try container.encode("player2")
        case .noOne: try container.encode("noOne")
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let ownerString = try container.decode(String.self)
        switch ownerString {
        case "player1": self = .player1
        case "player2": self = .player2
        case "noOne": self = .noOne
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown owner")
        }
    }
}
