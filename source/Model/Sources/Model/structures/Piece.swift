//
//  Piece.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Piece {
    public let owner : Owner
    public let animal : Animal
    
    public var description : String { "[\(self.owner.rawValue):\(self.animal)]" }
    
    public init(owner: Owner, animal: Animal) {
        self.owner = owner
        self.animal = animal
    }
}
