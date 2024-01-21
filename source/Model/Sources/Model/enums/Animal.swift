//
//  Animal.swift
//  
//
//  Created by etudiant on 11/01/2024.
//

import Foundation

public enum Animal {
    case rat
    case cat
    case dog
    case wolf
    case leopard
    case tiger
    case lion
    case elephant
    
    public var force: Int {
        switch self {
            case .rat: return 1
            case .cat: return 2
            case .dog: return 3
            case .wolf: return 4
            case .leopard: return 5
            case .tiger: return 6
            case .lion: return 7
            case .elephant: return 8
        }
    }
}
