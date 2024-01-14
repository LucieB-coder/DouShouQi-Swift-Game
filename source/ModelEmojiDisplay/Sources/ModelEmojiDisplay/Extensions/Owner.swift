//
//  Owner.swift
//
//
//  Created by etudiant on 14/01/2024.
//

import Foundation
import Model

extension Owner {
    var displaySymbol: String {
        switch self {
        case .noOne: return " "
        case .player1: return "🟡"
        case .player2: return "🔴"
        }
    }
}
