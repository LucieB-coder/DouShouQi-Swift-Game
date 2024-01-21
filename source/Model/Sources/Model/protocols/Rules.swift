//
//  Rules.swift
//
//
//  Created by etudiant on 1/21/24.
//

import Foundation

protocol Rules {
    func createBoard() -> Board
    func getNextPlayer() -> Owner
    func isMoveValid(board: Board, move: Move) -> Bool
    func isGameOver(board: Board) -> Bool
}
