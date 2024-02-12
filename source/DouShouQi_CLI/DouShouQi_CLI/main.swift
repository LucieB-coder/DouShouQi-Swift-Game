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
    guard let fromRowInput = readLine(),
          let fromRow = Int(fromRowInput) else {
        print("Invalid input for starting row")
        return nil
    }
    
    print("Enter the starting column:")
    guard let fromColumnInput = readLine(),
          let fromColumn = Int(fromColumnInput) else {
        print("Invalid input for starting column")
        return nil
    }
    
    print("Enter the ending row:")
    guard let toRowInput = readLine(),
          let toRow = Int(toRowInput) else {
        print("Invalid input for ending row")
        return nil
    }
    
    print("Enter the ending column:")
    guard let toColumnInput = readLine(),
          let toColumn = Int(toColumnInput) else {
        print("Invalid input for ending column")
        return nil
    }
    
    return Move(owner: .player1, fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn)!
}

func inputPlayers(humanInputMethod : @escaping () -> Move?) -> (Player, Player) {
    var players : [Player] = []
    
    for i in 1...2 {
        let id : Owner = i == 1 ? .player1 : .player2
        
        print("Enter name for Player \(i):")
        let name = readLine() ?? ""
                
        print("Is Player \(i) human or random? (h/r)")
        var validInput = false
        repeat {
            let input = readLine()

            switch input {
            case "h":
                validInput = true
                players.append(HumanPlayer(withName: name, andId: id, andInputMethod: humanInputMethod)!)
            case "r":
                validInput = true
                players.append(RandomPlayer(withId: id, andName: name)!)
            default:
                print("Invalid input. Please enter 'h' for human or 'r' for random.")
            }
        } while validInput == false
    }
    return (players[0], players[1])
}

let rules : Rules = VerySimpleRules()
let (player1, player2) = inputPlayers(humanInputMethod: inputMethod)
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
