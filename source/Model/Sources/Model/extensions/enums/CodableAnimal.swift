//
//  CodableAnimal.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation

extension Animal: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case animal
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .rat: try container.encode("rat", forKey: .animal)
        case .cat: try container.encode("cat", forKey: .animal)
        case .dog: try container.encode("dog", forKey: .animal)
        case .wolf: try container.encode("wolf", forKey: .animal)
        case .leopard: try container.encode("leopard", forKey: .animal)
        case .tiger: try container.encode("tiger", forKey: .animal)
        case .lion: try container.encode("lion", forKey: .animal)
        case .elephant: try container.encode("elephant", forKey: .animal)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let animalString = try container.decode(String.self, forKey: .animal)
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
            throw DecodingError.dataCorruptedError(forKey: .animal, in: container, debugDescription: "Unknown animal")
        }
    }
}


