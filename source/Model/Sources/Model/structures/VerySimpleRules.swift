//
//  VerySimpleRules.swift
//
//
//  Created by etudiant on 1/22/24.
//

import Foundation

public struct VerySimpleRules : Rules {
    
    public var occurences: [Board : Int]
    public var historic: [Move]
    
    public init(occurences: [Board : Int] = [:], historic: [Move] = []) {
        self.occurences = occurences
        self.historic = historic
    }
    
    public static func createBoard() -> Board {
        // Grid for board initialization
        let grid: [[Cell]] =
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
        // Returns the new board
        return Board(grid: grid)!
    }
    
    public static func checkBoard(b: Board) throws {
        // Check that the grid is not empty
        guard b.grid != [[]] else {
            throw InvalidBoardError.badDimensions(nbRows: 0, nbColumns: 0)
        }
        
        let numRows = b.grid.count
        let numCols = b.grid[0].count
        
        // Check that the number of rows is always the same as it was in the creation
        guard numRows == 5 else {
            throw InvalidBoardError.badDimensions(nbRows: numRows, nbColumns: numCols)
        }

        // Check that the number of columns is always the same as it was in the creation
        guard numCols == 5 else {
            throw InvalidBoardError.badDimensions(nbRows: numRows, nbColumns: numCols)
        }

        // Check that the all the rows have the same size
        guard b.grid.allSatisfy({ $0.count == b.nbColumns }) else {
            throw InvalidBoardError.badDimensions(nbRows: numRows, nbColumns: numCols)
        }
        
        // Check that the all the cells are of type .jungle or .den
        for (rowIndex, row) in b.grid.enumerated() {
            for (colIndex, cell) in row.enumerated() {
                guard cell.cellType == .den || cell.cellType == .jungle else {
                    throw InvalidBoardError.badCellType(cellType: cell.cellType, row: rowIndex, column: colIndex)
                }
            }
        }
        
        // Check that a piece is only in one occurence in the board and that it has an owner
        var encounteredPieces: Set<Piece> = Set()
        for row in b.grid {
            for cell in row {
                let piece = cell.piece
                
                guard piece != nil else {
                    continue // Skip empty cells
                }
                /*guard piece!.owner != nil else{
                    throw InvalidBoardError.pieceWithNoOwner(piece: piece!)
                }*/

                if !encounteredPieces.insert(piece!).inserted {
                    throw InvalidBoardError.multipleOccurencesOfSamePiece(piece: piece!)
                }
            }
        }
        
        // Check that a piece can be where it is
        // No cases in VerySimpleRules
        
    }
    
    public func getNextPlayer() -> Owner {
        if let lastPlayer = historic.last?.owner {
            if ( lastPlayer == .player1 ) {
                return .player2
            }
            return .player1
        }
        return .player1 
    }
    
    public func getMoves(board: Board, owner: Owner) -> [Move] {

        var validMoves : [Move] = []
        for (rowIndex, row) in board.grid.enumerated() {
            for (cellIndex,cell) in row.enumerated() {
                let piece = cell.piece
                
                guard piece != nil else {
                    continue // Skip empty cells
                }
                guard piece!.owner == owner else{
                    continue // Skip pieces of the oponent
                }
                let moves : [Move] = getMoves(board: board, owner: owner, fromRow: rowIndex, fromColumn : cellIndex)
                validMoves.append(contentsOf: moves)
            }
        }
        return validMoves
    }
    
    public func getMoves(board: Board, owner: Owner, fromRow: Int, fromColumn: Int) -> [Move] {
        var validMoves: [Move] = []

        let possibleMoves = [(0, 1), (0, -1), (1, 0), (-1, 0)]

        for (rowOffset, colOffset) in possibleMoves {
            let toRow = fromRow + rowOffset
            let toColumn = fromColumn + colOffset

            let newMove = Move(owner: owner, fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn)!

            do {
                if try isMoveValid(board: board, move: newMove) {
                    validMoves.append(newMove)
                }
            } catch {}
        }

        return validMoves
    }
    
    public func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) throws -> Bool {

        let currentPlayer: Owner = getNextPlayer()
        let move : Move = Move(owner: currentPlayer, fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn)!
        do{
            return try isMoveValid(board: board, move: move)
        } catch GameError.invalidMove {
            throw GameError.invalidMove
        }

    }
    
    
    public func isMoveValid(board: Board, move: Move) throws -> Bool  {
        let currentPlayer: Owner = move.owner
        
        // Check if the move is doesn't make a piece stay where it is
        guard move.fromRow != move.toRow || move.fromColumn != move.toColumn else {
            return false
        }
        
        // Check if the moove is in the board boundaries
        guard (move.fromRow <= board.nbRows-1 && move.fromRow >= 0) && (move.fromColumn <= board.nbColumns-1 && move.fromColumn >= 0) else {
            return false
        }
        guard (move.toRow <= board.nbRows-1 && move.toRow >= 0) && (move.toColumn <= board.nbColumns-1 && move.toColumn >= 0) else {
            return false
        }
        
        // Check if the moove is not in diagonal
        guard move.fromRow == move.toRow || move.fromColumn == move.toColumn else {
            return false
        }
        
        // Check if the piece at the starting position belongs to the player who makes the move
        let fromCell = board.grid[move.fromRow][move.fromColumn]
        guard fromCell.piece?.owner == move.owner else {
            return false
        }
        
        // Check if the destination cell is empty or occupied by an opponent's piece
        let toCell = board.grid[move.toRow][move.toColumn]
        let toPieceOwner = toCell.piece?.owner
        
        if toPieceOwner == nil || toPieceOwner != currentPlayer {
            
            // Get the animals involved in the move
            let movingAnimal: Animal = fromCell.piece!.animal
            let targetAnimal : Animal? = toCell.piece?.animal
            
            
            // Implement additional rules specific to each animal
            switch movingAnimal {
                
            case .rat:
                if(targetAnimal != nil){
                    // Rat cannot eat another animal than the elephant
                    guard targetAnimal == .elephant else{
                        return false
                    }
                }
                // Rat can move one square other than its den
                return isMoveOneSquare(move) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: move.owner)
                
            case .elephant:
                if(targetAnimal != nil){
                    // Elephant can eat every animal except rat
                    guard targetAnimal != .rat else{
                        return false
                    }
                }
                // Elephant can move one square other than its den
                return isMoveOneSquare(move) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: move.owner)
                
            default:
                // Handle attack between animals (check if the moving Animal is not on a trap
                if(targetAnimal != nil){
                    guard isAnimalAbleToAttack(movingAnimal: movingAnimal, targetAnimal: targetAnimal!) else {
                        return false
                    }
                }
                // Animals can move one square other than their den
                return isMoveOneSquare(move) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: move.owner)
            }
            
        }
        
        return false
        
        func isMoveOneSquare(_ move: Move) -> Bool {
            let rowDifference = abs(move.toRow - move.fromRow)
            let columnDifference = abs(move.toColumn - move.fromColumn)
            return (rowDifference == 1 && columnDifference == 0) || (rowDifference == 0 && columnDifference == 1)
        }
    }
    
    // Helper method to check if the target cell of a move is its den
    private func isTargetNotSelfDen(targetCell: Cell, board : Board, owner: Owner ) -> Bool {
        return !(targetCell.cellType == .den && targetCell.initialOwner == owner)
    }
    
    // Helper method to check if an animal can attack another
    private func isAnimalAbleToAttack(movingAnimal: Animal, targetAnimal: Animal) -> Bool {
        return targetAnimal.force <= movingAnimal.force
    }
    
    public func isGameOver(board: Board, row: Int, column: Int) -> (Bool, Result) {
        // no even case with those rules
        
        // Case of win if the den is reached
        if column == 2 && (row == 0 || row == 4) {
            return (true, .winner(owner: historic.last?.owner ?? .noOne , reason: .denReached))
        }
        
        // Case of win if a player has no pieces left
        let (player1, player2) = board.countPieces()
        if player1 == 0 || player2 == 0 {
            return (true, .winner(owner: historic.last?.owner ?? .noOne, reason: .noMorePieces))
        }
        
        // Case that the player cannot make any move anymore
        let validRemainingMoves =  getMoves(board: board, owner: getNextPlayer())
        if validRemainingMoves.isEmpty {
            return (true, .winner(owner: historic.last?.owner ?? .noOne, reason: .noMovesLeft))
        }
        
        // The game is not over
        return (false,.notFinished)
    }
    
    public mutating func playedMove(move: Move, boardBeforeMove: Board, boardAfterMove: Board) {
        do{
            if try isMoveValid(board: boardBeforeMove, move: move){
                self.historic.append(move)
            }
        } catch GameError.invalidMove {}
        catch{}
    }
}
