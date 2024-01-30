//
//  Player.swift
//
//
//  Created by etudiant on 1/30/24.
//

import Foundation

public class Player {
    public var id : Owner
    public var name: String
    
    public init?(withId id: Owner, andName name: String) {
        guard id != .noOne else{
            return nil
        }
        self.id = id
        self.name = name
    }
    
    public func chooseMove(in board: Board, with rules: Rules) -> Move?{
        // What should I do here ???
        return nil
    }
}
