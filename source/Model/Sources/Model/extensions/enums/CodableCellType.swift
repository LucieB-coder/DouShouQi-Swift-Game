//
//  CodableCellType.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation
import Model

extension CellType : Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .water: try container.encode("water")
        case .trap: try container.encode("trap")
        case .den: try container.encode("den")
        case .jungle: try container.encode("jungle")
        case .unknown: try container.encode("unknown")
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let cellTypeString = try container.decode(String.self)
        switch cellTypeString {
        case "water": self = .water
        case "trap": self = .trap
        case "den": self = .den
        case "jungle": self = .jungle
        case "unknown": self = .unknown
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown cellType")
        }
    }
}
