//
//  RandomPlayer.swift
//
//
//  Created by etudiant on 1/30/24.
//

import Foundation

public class RandomPlayer : Player {
    
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        let validMoves = rules.getMoves(board: board, owner: self.id)
        return validMoves.randomElement()
    }
}
