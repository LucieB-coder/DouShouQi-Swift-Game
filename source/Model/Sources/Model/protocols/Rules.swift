//
//  Rules.swift
//
//
//  Created by etudiant on 1/21/24.
//

import Foundation

public protocol Rules {
    var occurences : [Board:Int] { get }
    var historic : [Move] { get }
    
    static func createBoard() -> Board
    static func checkBoard(b:Board) throws
    func getNextPlayer() -> Owner
    func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool
    func isMoveValid(board: Board, move: Move) -> Bool
    func getMoves(board: Board, owner:Owner, fromRow: Int, fromColumn: Int) -> [Move]
    func getMoves(board: Board, owner:Owner) -> [Move]
    func isGameOver(board: Board, row: Int, column: Int) -> (Bool, Result)
    func playedMove(move: Move, boardBeforeMove: Board, boardAfterMove: Board)
}
