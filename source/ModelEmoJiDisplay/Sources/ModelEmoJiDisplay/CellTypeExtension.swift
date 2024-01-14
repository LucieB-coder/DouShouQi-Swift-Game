
//
//  CellTypeExtension.swift
//
//
//  Created by etudiant on 14/01/2024.
//

import Foundation
import Model

public extension CellType {
    var displaySymbol: String {
        switch self {
        case .unknown: return " "
        case .jungle: return "🌿"
        case .den: return "🪹"
        case .trap: return "🪤"
        case .water: return "💧"
        }
    }
}
