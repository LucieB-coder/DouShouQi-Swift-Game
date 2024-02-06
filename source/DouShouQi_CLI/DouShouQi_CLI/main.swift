//
//  main.swift
//  DouShouQi_CLI
//
//  Created by etudiant on 12/01/2024.
//

import Foundation
import Model
import ModelEmojiDisplayer

let inputMethod: () -> Move? = {
    print("Enter the starting row:")
    let fromRow : Int? = Int(readLine()!)
    print("Enter the starting column:")
    let fromColumn : Int? = Int(readLine()!)
    print("Enter the ending row:")
    let toRow : Int? = Int(readLine()!)
    print("Enter the ending column:")
    let toColumn : Int? = Int(readLine()!)
    
    if (fromRow == nil || fromColumn  == nil || toRow  == nil || toColumn == nil){
        return nil
    } else {
        return Move(owner: .player2, fromRow: fromRow!, fromColumn: fromColumn!, toRow: toRow!, toColumn: toColumn!)

    }
}

let rules : Rules = VerySimpleRules()
let player1 : Player = RandomPlayer(withId: .player1, andName: "Lucie")!
let player2 : Player = HumanPlayer(withName: "Guillaume", andId: .player2, andInputMethod: inputMethod)!
var game : Game = Game(withRules: rules, andPlayer1: player1, andPlayer2: player2)

game.onGameStart = gameStartsDisplayer
game.onPlayersTurn = playersTurnDisplayer
game.onInvalidMove = invalidMoveDisplayer
game.onPlayerMadeMove = playerMadeMoveDisplayer
game.onBoardChanged = boardChangedDisplayer
game.onTurnEnds = turnEndsDisplayer

game.start()

func gameStartsDisplayer(board : Board) {
    print("**************************************")
    print("        ==>> GAME STARTS! <<==        ")
    print("**************************************\n")
    
    print(board)
}

func playersTurnDisplayer(player : Player) {
    print("**************************************")
    print("\(player), it's your turn!")
    print("**************************************\n")
}

func playerMadeMoveDisplayer(move : Move, player : Player) {
    print("**************************************")
    print("\(player), has chosen : \(move)")
    print("**************************************\n")
}

func invalidMoveDisplayer() {
    print("This move is invalid, please try again")
}

func boardChangedDisplayer(board: Board){
    print(board)
}

func turnEndsDisplayer(result : Result) {
    switch (result){
    case .even :
        print("**************************************")
        print("Game Over !")
        print("There is no winner :(")
        print("Players are even")
        print("**************************************\n")
        break
    case .notFinished :
        print("⏳ Game is not over yet")
    case .winner(let owner, let winningReason) :

        print("**************************************")
        print("Game Over !")
        print("And the winner is ... \(owner)")
        print(winningReason)
        print("**************************************\n")
    }
}
