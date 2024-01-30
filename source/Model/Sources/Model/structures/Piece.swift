//
//  Piece.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Piece : CustomStringConvertible {
    public let owner : Owner
    public let animal : Animal
    
    public var description : String { "[\(self.owner):\(self.animal)]" }
    
    public init(owner: Owner, animal: Animal) {
        self.owner = owner
        self.animal = animal
    }
}
