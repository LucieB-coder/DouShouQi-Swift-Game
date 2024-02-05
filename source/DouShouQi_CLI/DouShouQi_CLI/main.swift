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

var board = Board(grid: grid)!
var rules = VerySimpleRules()

let inputMethod: () -> Move? = {
    var move : Move? = nil
    var isValid : Bool = false

    
    print("Enter the starting row:")
    var fromRow : Int? = Int(readLine()!)
    print("Enter the starting column:")
    var fromColumn : Int? = Int(readLine()!)
    print("Enter the ending row:")
    var toRow : Int? = Int(readLine()!)
    print("Enter the ending column:")
    var toColumn : Int? = Int(readLine()!)
    
    if (fromRow == nil || fromColumn  == nil || toRow  == nil || toColumn == nil){
        print("Invalid coordinates")
    } else {
        move = Move(owner: .player2, fromRow: fromRow!, fromColumn: fromColumn!, toRow: toRow!, toColumn: toColumn!)
        isValid = rules.isMoveValid(board: board, move: move!)
    }
    
    while (move == nil || isValid == false){
        if (isValid == false) { print ("Invalid move") }
        print("Enter the starting row:")
        fromRow = Int(readLine()!)
        print("Enter the starting column:")
        fromColumn = Int(readLine()!)
        print("Enter the ending row:")
        toRow = Int(readLine()!)
        print("Enter the ending column:")
        toColumn = Int(readLine()!)
        if (fromRow == nil || fromColumn  == nil || toRow  == nil || toColumn == nil){
            print("Invalid coordinates")
        } else {
            move = Move(owner: .player1, fromRow: fromRow!, fromColumn: fromColumn!, toRow: toRow!, toColumn: toColumn!)
            isValid = rules.isMoveValid(board: board, move: move!)
        }
    }
    return move
}


// Test game


var currentPlayer : Owner = .noOne
let randomPlayer : RandomPlayer = RandomPlayer(withId: .player1, andName: "Lucie")!
let humanPlayer : HumanPlayer = HumanPlayer(withName: "Guillaume", andId: .player2, andInputMethod: inputMethod)!
var result : (Bool,Result) = (false, .notFinished)

while(result.0 == false){
    let currentPlayer : Owner = rules.getNextPlayer()
    var combat = false
    var resEatPiece: BoardResult? = nil
    print(board)
    if (currentPlayer == .player1){
        print("\(randomPlayer.name)' turn")
        if let move : Move = randomPlayer.chooseMove(in: board, with: rules){
            let beforeBoard = board
            if (board.grid[move.toRow][move.toColumn].piece != nil){
                combat = true
                resEatPiece = board.removePiece(atRow: move.toRow, andColumn: move.toColumn)
            }
            
            let resInsert : BoardResult =  board.insert(piece: board.grid[move.fromRow][move.fromColumn].piece!, atRow: move.toRow, andColumn: move.toColumn)
            let resRemove : BoardResult = board.removePiece(atRow: move.fromRow, andColumn: move.fromColumn)
            
            let resEat : BoardResult = {if combat == false { .ok } else { resEatPiece! } }()
            
            if(resInsert == .ok && resRemove == .ok && resEat == .ok ) {
                rules.playedMove(move: move, boardBeforeMove: beforeBoard, boardAfterMove: board)
                result = rules.isGameOver(board: board, row: move.toRow, column: move.toColumn)
                print("\(randomPlayer.name) played \(move)")
            } else{
               print("Problem inserting and removing piece")
            }
        } else {
            print("Invalid move !")
        }
    }
    else{
        print("\(humanPlayer.name)' turn")
        if let move : Move = humanPlayer.chooseMove(in: board, with: rules){
            let beforeBoard = board
            if (board.grid[move.toRow][move.toColumn].piece != nil){
                combat = true
                resEatPiece = board.removePiece(atRow: move.toRow, andColumn: move.toColumn)
            }
            let resInsert : BoardResult =  board.insert(piece: board.grid[move.fromRow][move.fromColumn].piece!, atRow: move.toRow, andColumn: move.toColumn)
            let resRemove : BoardResult = board.removePiece(atRow: move.fromRow, andColumn: move.fromColumn)
            if(resInsert == .ok && resRemove == .ok){
                rules.playedMove(move: move, boardBeforeMove: beforeBoard, boardAfterMove: board)
                result = rules.isGameOver(board: board, row: move.toRow, column: move.toColumn)
                print("\(randomPlayer.name) played \(move)")
            } else{
               print("Problem inserting and removing piece")
            }
        } else {
            print("Invalid move !")
        }
    }
}
print("Game over")
