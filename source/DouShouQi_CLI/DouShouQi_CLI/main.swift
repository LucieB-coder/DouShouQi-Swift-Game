//
//  main.swift
//  DouShouQi_CLI
//
//  Created by etudiant on 12/01/2024.
//

import Foundation
import Model
import ModelEmojiDisplayer

var grid =
[
    [Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
     Cell(cellType: .den, initialOwner: .player1),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
     Cell(cellType: .jungle)],

    [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
    
    [Cell(cellType: .jungle),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle),],
    
    [Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .elephant)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
    
    [Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
     Cell(cellType: .den, initialOwner: .player2),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
     Cell(cellType: .jungle)],
]

let board = Board(grid: grid)!
let rules = VerySimpleRules()

let inputMethod: () -> Move? = {
    print("Enter the starting row:")
    guard let fromRowInput = readLine(), let fromRow = Int(fromRowInput) else { return nil }
    
    print("Enter the starting column:")
    guard let fromColumnInput = readLine(), let fromColumn = Int(fromColumnInput) else { return nil }
    
    print("Enter the ending row:")
    guard let toRowInput = readLine(), let toRow = Int(toRowInput) else { return nil }
    
    print("Enter the ending column:")
    guard let toColumnInput = readLine(), let toColumn = Int(toColumnInput) else { return nil }
    let move : Move = Move(owner: .player1, fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn)!
    guard rules.isMoveValid(board: board, move: move) else {
        return nil
    }
    return move
}
print(board)
// Test of random player
let randomPlayer : RandomPlayer = RandomPlayer(withId: .player1, andName: "Lucie")!
let move : Move = randomPlayer.chooseMove(in: board, with: rules)!
print("\(randomPlayer.name) a joué le coup \(move)")

// Test of human player
let humanPlayer : HumanPlayer = HumanPlayer(withName: "Guillaume", andId: .player1, andInputMethod: inputMethod)!
let res : Move? = humanPlayer.chooseMove(in: board, with: rules)
if (res != nil){
    print("\(humanPlayer.name) a joué le coup \(res!)")
}
else {
    print("Invalid move :(")
}
