//
//  Owner.swift
//  
//
//  Created by etudiant on 11/01/2024.
//

import Foundation

public enum Owner : String, CustomStringConvertible {

    case player1
    case player2
    case noOne
    
    public var description: String {
        switch self {
            case .player1: return "1"
            case .player2: return "2"
            case .noOne: return "x"
        }
    }
}
