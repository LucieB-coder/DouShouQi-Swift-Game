//
//  CodableOwner.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation

extension Owner : Codable {
    private enum CodingKeys: String, CodingKey {
        case owner
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .player1: try container.encode("player1", forKey: .owner)
        case .player2: try container.encode("player2", forKey: .owner)
        case .noOne: try container.encode("noOne", forKey: .owner)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let ownerString = try container.decode(String.self, forKey: .owner)
        switch ownerString {
        case "player1": self = .player1
        case "player2": self = .player2
        case "noOne": self = .noOne
        default:
            throw DecodingError.dataCorruptedError(forKey: .owner, in: container, debugDescription: "Unknown owner")
        }
    }
}
