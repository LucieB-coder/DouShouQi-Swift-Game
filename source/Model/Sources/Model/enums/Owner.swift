//
//  Owner.swift
//  
//
//  Created by etudiant on 11/01/2024.
//

import Foundation

public enum Owner : String, CustomStringConvertible {

    case player1 = "1"
    case player2 = "2"
    case noOne = "x"
    
    public var description: String { self.rawValue }
}
