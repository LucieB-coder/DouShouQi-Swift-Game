//
//  CodableAnimal.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation
import Model

extension Animal: Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .rat: try container.encode("rat")
        case .cat: try container.encode("cat")
        case .dog: try container.encode("dog")
        case .wolf: try container.encode("wolf")
        case .leopard: try container.encode("leopard")
        case .tiger: try container.encode("tiger")
        case .lion: try container.encode("lion")
        case .elephant: try container.encode("elephant")
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let animalString = try container.decode(String.self)
        switch animalString {
        case "rat": self = .rat
        case "cat": self = .cat
        case "dog": self = .dog
        case "wolf": self = .wolf
        case "leopard": self = .leopard
        case "tiger": self = .tiger
        case "lion": self = .lion
        case "elephant": self = .elephant
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown animal")
        }
    }
}


