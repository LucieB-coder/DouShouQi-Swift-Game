//
//  Piece.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Piece {
    let owner : Owner
    let animal : Animal
    
    var description : String { "[\(self.owner.rawValue):\(self.animal)]" }
    
    init(owner: Owner, animal: Animal) {
        self.owner = owner
        self.animal = animal
    }
}
