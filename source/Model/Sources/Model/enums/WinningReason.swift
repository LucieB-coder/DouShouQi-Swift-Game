//
//  WinningReason.swift
//
//
//  Created by etudiant on 1/22/24.
//

import Foundation

public enum WinningReason : Equatable, CustomStringConvertible {
    case denReached
    case noMorePieces
    case noMovesLeft
    case tooManyOccurences
    
    public var description: String{
        switch self {
            case .denReached : return "The opponent's den has been reached"
            case .noMorePieces : return "The opponent has seen all his animals get eaten"
            case .noMovesLeft : return "The opponent's can not move"
            case .tooManyOccurences : return "I have seen this board to many times, you guys are boring"
        }
    }
}
