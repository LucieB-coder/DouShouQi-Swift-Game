//
//  Game.swift
//
//
//  Created by etudiant on 2/5/24.
//

import Foundation

public struct Game {
    /// Properties
    public var rules : Rules
    public let player1 : Player
    public let player2 : Player
    public var board : Board
    
    /// Notification handlers
    public var onGameStart : ((Board) -> Void)?
    public var onPlayersTurn : ((Player) -> Void)?
    public var onInvalidMove : (() -> Void)?
    public var onPlayerMadeMove : ((Move, Player) -> Void)?
    public var onTurnEnds : ((Result) -> Void)?
    public var onBoardChanged : ((Board) -> Void)?
    
    /// Initializer
    /// - Parameters:
    ///   - rules: rules of the game
    ///   - player1: player 1
    ///   - player2: player 2
    public init(withRules rules: Rules, andPlayer1 player1: Player, andPlayer2 player2: Player) {
        self.rules = rules
        self.player1 = player1
        self.player2 = player2
        self.board = type(of: rules).createBoard()
    }
    
    /// Setters of the notifications handlers methods
    public mutating func setOnGameStart(gameStartedHandler started : @escaping (Board) -> Void ){
        onGameStart = started
    }
    public mutating func setOnPlayersTurn(onPlayersTurnHandler playersTurn : @escaping (Player) -> Void ){
        onPlayersTurn = playersTurn
    }
    public mutating func setOnInvalidMove(onInvalidMove invalidMove : @escaping () -> Void ){
        onInvalidMove = invalidMove
    }
    public mutating func setOnPlayerMadeMove(onPlayerMadeMove playerMadeMove : @escaping (Move, Player) -> Void ){
        onPlayerMadeMove = playerMadeMove
    }
    public mutating func setOnTurnEnds(onTurnEnds turnEnds : @escaping (Result) -> Void ){
        onTurnEnds = turnEnds
    }
    public mutating func setOnBoardChanged(onBoardChanged boardChanged : @escaping (Board) -> Void ){
        onBoardChanged = boardChanged
    }
    
    /// Method initiating the game cicle
    mutating public func start() {
        
        var currentPlayer : Player = rules.getNextPlayer() == .player1 ? player1 : player2
        var gameResult : (Bool,Result) = (false, .notFinished)
        
        // Game starts its turn notification
        if let start : (Board) -> Void = onGameStart { start(self.board) }
        
        // Init game cycle
        while ( gameResult.0 == false ){
            
            // Player starts its turn notification
            if let playersTurn : (Player) -> Void = onPlayersTurn { playersTurn(currentPlayer) }
            // Make the player choose a valid move
            let move : Move = chooseAValidMove(currentPlayer: currentPlayer)
            
            // Player played move notification
            if let playerMadeMove : (Move,Player) -> Void = onPlayerMadeMove { playerMadeMove(move,currentPlayer) }
            
            let beforeMoveBoard : Board = board
            playMove(board: board, move: move)
            rules.playedMove(move: move, boardBeforeMove: beforeMoveBoard, boardAfterMove: board)
            
            // Board changed notification
            if let boardChanged : (Board) -> Void = onBoardChanged { boardChanged(board) }
            
            gameResult = rules.isGameOver(board: board, row: move.toRow, column: move.toColumn)
            
            // turnEnds Notification
            if let turnEnds : (Result) -> Void = onTurnEnds { turnEnds(gameResult.1) }
            
            currentPlayer = rules.getNextPlayer() == .player1 ? player1 : player2
        }
        
    }
    
    /// Method asking the player to choose a move and check if it is valid
    /// - Parameter currentPlayer
    /// - Returns: chosen valid move
    mutating private func chooseAValidMove (currentPlayer : Player) -> Move {
        var move : Move? = currentPlayer.chooseMove(in: board, with: rules)
        if (move != nil){
            move!.owner = currentPlayer.id
        }
        while(move == nil || rules.isMoveValid(board: board, move: move!) == false){
            //Invalid move notification
            if let invalidMove : () -> Void = onInvalidMove { invalidMove() }
            
            move = currentPlayer.chooseMove(in: board, with: rules)
            if (move != nil){
                move!.owner = currentPlayer.id
            }
        }
        return move!
    }
    
    /// Method updating the board after we ensure that the move is valid
    /// - Parameters:
    ///   - board: current board on wich the move must be applied on
    ///   - move: move to apply
    mutating private func playMove (board: Board, move : Move) {
        if (board.grid[move.toRow][move.toColumn].piece != nil){
            self.board.removePiece(atRow: move.toRow, andColumn: move.toColumn)
        }
        self.board.insert(piece: board.grid[move.fromRow][move.fromColumn].piece!, atRow: move.toRow, andColumn: move.toColumn)
        self.board.removePiece(atRow: move.fromRow, andColumn: move.fromColumn)
        
    }
    
}
