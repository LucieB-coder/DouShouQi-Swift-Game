//
//  ClassicRules.swift
//
//
//  Created by etudiant on 1/24/24.
//

import Foundation

public struct ClassicRules : Rules {
    public var occurences: [Board : Int]
    
    public var historic: [Move]
    
    public static func checkBoard(b: Board) throws {
        // Check that the grid is not empty
        guard b.grid != [[]] else {
            throw InvalidBoardError.badDimensions(nbRows: 0, nbColumns: 0)
        }
        
        let numRows = b.grid.count
        let numCols = b.grid[0].count
        
        // Check that the number of rows is always the same as it was in the creation
        guard numRows == 7 else {
            throw InvalidBoardError.badDimensions(nbRows: numRows, nbColumns: numCols)
        }

        // Check that the number of columns is always the same as it was in the creation
        guard numCols == 10 else {
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
        // Implement for Classic Rules
    }
    
    public func getNextPlayer() -> Owner {
        return historic.last?.owner == .player1 ? .player2 : .player1
    }
    
    // 🚨 Need to implement classicRules specifications here
    public func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool {
        let currentPlayer: Owner = getNextPlayer() == .player1 ? .player2 : .player1
        
        // Check if the move is doesn't make a piece stay where it is
        guard fromRow != toRow || fromColumn != toColumn else {
            return false
        }
        
        // Check if the moove is in the board boundaries
        guard (toRow <= 4 && toRow >= 0) && (toColumn <= 4 && toColumn >= 0) else {
            return false
        }
        
        // Check if the moove is not in diagonal
        guard fromRow == toRow || fromColumn == toColumn else {
            return false
        }
        
        // Check if the piece at the starting position belongs to the player who makes the move
        let fromCell = board.grid[fromRow][fromColumn]
        guard fromCell.piece?.owner == getNextPlayer() else {
            return false
        }
        
        // Check if the destination cell is empty or occupied by an opponent's piece
        let toCell = board.grid[toRow][toColumn]
        let toPieceOwner = toCell.piece?.owner
        
        if toPieceOwner != nil || toPieceOwner != currentPlayer {
            
            // Get the animals involved in the move
            let movingAnimal: Animal = fromCell.piece!.animal
            let targetAnimal : Animal? = toCell.piece?.animal
            
            // Implement additional rules specific to each animal
            switch movingAnimal {
            case .rat:
                if(targetAnimal != nil){
                    print(targetAnimal!)
                    // Rat cannot eat another animal than the elephant
                    guard targetAnimal == .elephant else {
                        return false
                    }
                }
                // Rat can move one square other than its den
                return isMoveOneSquare(fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: board.grid[fromRow][fromColumn].initialOwner)
                
            case .elephant:
                if(targetAnimal != nil){
                    // Elephant can eat every animal except rat
                    guard targetAnimal != .rat else {
                        return false
                    }
                }
                // Elephant can move one square other than its den
                return isMoveOneSquare(fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: board.grid[fromRow][fromColumn].initialOwner)
                              
            default:
                // Handle attack between animals (check if the moving Animal is not on a trap
                if(targetAnimal != nil){
                    guard isAnimalAbleToAttack(movingAnimal: movingAnimal, targetAnimal: targetAnimal!) else {
                        return false
                    }
                }
                // Animals can move one square other than their den
                return isMoveOneSquare(fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: board.grid[fromRow][fromColumn].initialOwner)
            }
            
        }
        
        return false
        
        // Helper method to check if the move is one square horizontally or vertically
        func isMoveOneSquare(fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool {
            let rowDifference = abs(toRow - fromRow)
            let columnDifference = abs(toColumn - fromColumn)
            return (rowDifference == 1 && columnDifference == 0) || (rowDifference == 0 && columnDifference == 1)
        }
    }
    
    
    public func getMoves(board: Board, owner: Owner) -> [Move] {
        print(board,owner)
        var validMoves : [Move] = []
        for (rowIndex, row) in board.grid.enumerated() {
            for (cellIndex,cell) in row.enumerated() {
                let piece = cell.piece
                
                guard piece != nil else {
                    continue // Skip empty cells
                }
                print("i found the \(piece!.animal) of \(piece!.owner)")
                guard piece!.owner == owner else{
                    continue // Skip pieces of the oponent
                }
                print("Hey this is my piece !")
                let moves : [Move] = getMoves(board: board, owner: owner, fromRow: rowIndex, fromColumn : cellIndex)
                print(moves)
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

            if isMoveValid(board: board, move: newMove) {
                validMoves.append(newMove)
            }
        }

        return validMoves
    }
    
    // 🚨 Need to implement classicRules specifications here
    public func isGameOver(board: Board, row: Int, column: Int) -> (Bool, Result) {
        // no even case with those rules
        
        // Case of win if the den is reached
        if column == 3 && (row == 0 || row == 4) {
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
        self.occurences.updateValue((self.occurences[boardAfterMove] ?? 0 )+1, forKey: boardAfterMove)
        self.historic.append(move)
        return
    }
    
    
    // There are two players, player1 and player2
    // Replace Owner by player next TP
    private var currentPlayer: Owner = .player1
    
    public static func createBoard() -> Board {
        // Grid for board initialization
        let grid: [[Cell]] =
        [
            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .jungle),
             Cell(cellType: .trap),
             Cell(cellType: .den),
             Cell(cellType: .trap),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .dog)),
             Cell(cellType: .jungle),
             Cell(cellType: .trap),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle)],
            
            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .leopard)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .wolf)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .water),
             Cell(cellType: .water),
             Cell(cellType: .jungle),
             Cell(cellType: .water),
             Cell(cellType: .water),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .water),
             Cell(cellType: .water),
             Cell(cellType: .jungle),
             Cell(cellType: .water),
             Cell(cellType: .water),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .water),
             Cell(cellType: .water),
             Cell(cellType: .jungle),
             Cell(cellType: .water),
             Cell(cellType: .water),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .water),
             Cell(cellType: .water),
             Cell(cellType: .jungle),
             Cell(cellType: .water),
             Cell(cellType: .water),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .elephant)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .wolf)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .leopard)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .trap),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .dog)),
             Cell(cellType: .jungle)],
            
            [Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .jungle),
             Cell(cellType: .trap),
             Cell(cellType: .den),
             Cell(cellType: .trap),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion))],
        ]
        // Returns the new board
        return Board(grid: grid)!
    }
    
    // 🚨 Need to complete classicRules here
    public func isMoveValid(board: Board, move: Move) -> Bool {
        
        // Check if the move is doesn't make a piece stay where it is
        /*guard move.fromRow != move.toRow || move.fromColumn != move.toColumn else {
            return false
        }
        
        // Check if the moove is in the board boundaries
        guard (move.toRow <= 7 && move.toRow >= 0) && (move.toColumn <= 10 && move.toColumn >= 0) else {
            return false
        }
        
        // Check if the moove is not in diagonal
        guard move.fromRow == move.toRow || move.fromColumn == move.toColumn else {
            return false
        }
        
        // Check if the piece at the starting position belongs to the current player
        let fromCell = board.grid[move.fromRow][move.fromColumn]
        guard fromCell.piece?.owner == currentPlayer else {
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
                    // Rat cannot eat another animal than the elephant if it is not on a trap
                    // Rat can eat every animal if they are in a trap
                    guard (targetAnimal == .elephant && fromCell.cellType != .trap) || toCell.cellType == .trap else{
                        return false
                    }
                    // Rat cannot attack if it is in water
                    guard fromCell.cellType != .water else{
                        return false
                    }
                }
                // Rat can move one square
                return isMoveOneSquare(move) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: move.owner)
                
            case .elephant:
                if(targetAnimal != nil){
                    // Elephant can eat every animal except rat if it is not on a trap
                    // Elephant can eat every animal if they are in a trap
                    guard (targetAnimal != .rat && fromCell.cellType != .trap) || toCell.cellType == .trap else{
                        return false
                    }
                }
                // Elephant can move one square other than water
                return isMoveOneSquare(move) && toCell.cellType != .water && isTargetNotSelfDen(targetCell: toCell, board: board, owner: move.owner)
                
            case .lion, .tiger:
                // Lion and Tiger can eat every animal with a lower or equal force than them and if it is not on a trap
                if(targetAnimal != nil){
                    guard isAnimalAbleToAttack(movingAnimal: movingAnimal, targetAnimal: targetAnimal!, fromCell: fromCell, toCell: toCell) else {
                        return false
                    }
                }
                // Lion and Tiger can jump over water or move one square
                return (isJumpOverWater(move, board) || isMoveOneSquare(move)) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: move.owner)
                
            default:
                // Handle attack between animals (check if the moving Animal is not on a trap
                if(targetAnimal != nil){
                    guard isAnimalAbleToAttack(movingAnimal: movingAnimal, targetAnimal: targetAnimal!, fromCell: fromCell, toCell: toCell) else {
                        return false
                    }
                }
                // Animals can move one square other than their den
                return isMoveOneSquare(move) && isTargetNotSelfDen(targetCell: toCell, board: board, owner: move.owner)
            }
            
        }
        */
        return false
    }
    
    // Helper method to check if the move is one square horizontally or vertically
    private func isMoveOneSquare(_ move: Move) -> Bool {
        let rowDifference = abs(move.toRow - move.fromRow)
        let columnDifference = abs(move.toColumn - move.fromColumn)
        return (rowDifference == 1 && columnDifference == 0) || (rowDifference == 0 && columnDifference == 1)
    }
    
    // Helper method to check if the move jumps over a water cell
    private func isJumpOverWater(_ move: Move,_ board: Board) -> Bool {
        // Assuming water is represented by the .water cell type
        let middleRow = (move.fromRow + move.toRow) / 2
        let middleColumn = (move.fromColumn + move.toColumn) / 2

        return board.grid[middleRow][middleColumn].cellType == .water
    }
    
    // Helper method to check if an animal can attack another
    private func isAnimalAbleToAttack(movingAnimal: Animal,targetAnimal: Animal, fromCell: Cell, toCell: Cell) -> Bool {
        return (targetAnimal.force <= movingAnimal.force || toCell.cellType == .trap ) && fromCell.cellType != .trap
    }
    
    // 🚨 Need to delete this function after implementation of classic rules
    private func isAnimalAbleToAttack(movingAnimal: Animal, targetAnimal: Animal) -> Bool {
        return targetAnimal.force <= movingAnimal.force
    }
    
    // Helper method to check if the target cell of a move is its den
    private func isTargetNotSelfDen(targetCell: Cell, board : Board, owner: Owner ) -> Bool {
        return !(targetCell.cellType == .den && targetCell.initialOwner == owner)
    }
    
    public init(occurences: [Board : Int] = [:], historic: [Move] = []) {
        self.occurences = occurences
        self.historic = historic
    }
    
    
}
