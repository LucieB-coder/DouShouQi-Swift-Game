//
//  GameError.swift
//
//
//  Created by etudiant on 1/22/24.
//

import Foundation

public enum GameError : Error {
    case invalidMove
    case nextPlayerError
    case badPlayerId(id: String)
}
