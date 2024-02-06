//
//  HumanPlayer.swift
//
//
//  Created by etudiant on 1/30/24.
//

import Foundation

public class HumanPlayer: Player {
    public let input: () -> Move?

    public init?(withName name: String, andId id: Owner, andInputMethod inputMethod: @escaping () -> Move?) {
        self.input = inputMethod
        super.init(withId: id, andName: name)
    }

    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        let move : Move? = input()
        return move
    }
}

