//
//  Animal.swift
//
//
//  Created by etudiant on 15/01/2024.
//

import Foundation
import Model

public extension Animal {
    var symbol: String {
        switch self {
        case .rat: return "🐭"
        case .cat: return "🐱"
        case .dog: return "🐶"
        case .wolf: return "🐺"
        case .leopard: return "🐆"
        case .tiger: return "🐯"
        case .lion: return "🦁"
        case .elephant: return "🐘"
        }
    }
}
