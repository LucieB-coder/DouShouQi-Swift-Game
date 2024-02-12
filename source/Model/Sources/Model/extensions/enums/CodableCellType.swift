//
//  CodableCellType.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation

extension CellType : Codable {
    private enum CodingKeys: String, CodingKey {
        case cellType
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .water: try container.encode("water", forKey: .cellType)
        case .trap: try container.encode("trap", forKey: .cellType)
        case .den: try container.encode("den", forKey: .cellType)
        case .jungle: try container.encode("jungle", forKey: .cellType)
        case .unknown: try container.encode("unknown", forKey: .cellType)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let cellTypeString = try container.decode(String.self, forKey: .cellType)
        switch cellTypeString {
        case "water": self = .water
        case "trap": self = .trap
        case "den": self = .den
        case "jungle": self = .jungle
        case "unknown": self = .unknown
        default:
            throw DecodingError.dataCorruptedError(forKey: .cellType, in: container, debugDescription: "Unknown cellType")
        }
    }
}
