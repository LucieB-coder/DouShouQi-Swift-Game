//
//  ClassicRules.swift
//
//
//  Created by etudiant on 1/21/24.
//

import Foundation

public class ClassicRules /* : Rules */ {
    
    // There are two players, player1 and player2
    // Replace Owner by player next TP
    private var currentPlayer: Owner = .player1
    
    func createBoard() -> Board {
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
    
    func getNextPlayer() -> Owner {
        currentPlayer = (currentPlayer == .player1) ? .player2 : .player1
        return currentPlayer
    }
    
    // Incomplete rules
    func isMoveValid(board: Board, move: Move) -> Bool {
        
        // Check if the move is doesn't make a piece stay where it is
        guard move.fromRow != move.toRow || move.fromColumn != move.toColumn else {
            return false
        }
        
        // Check if the moove is in the board boundaries
        guard move.toRow <= board.nbRows && move.toColumn <= board.nbColumns else {
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
                return isMoveOneSquare(move) && isTargetSelfDen(targetCell: toCell, board: board)
                
            case .elephant:
                if(targetAnimal != nil){
                    // Elephant can eat every animal except rat if it is not on a trap
                    // Elephant can eat every animal if they are in a trap
                    guard (targetAnimal != .rat && fromCell.cellType != .trap) || toCell.cellType == .trap else{
                        return false
                    }
                }
                // Elephant can move one square other than water
                return isMoveOneSquare(move) && toCell.cellType != .water && isTargetSelfDen(targetCell: toCell, board: board)
                
            case .lion, .tiger:
                // Lion and Tiger can eat every animal with a lower or equal force than them and if it is not on a trap
                if(targetAnimal != nil){
                    guard isAnimalAbleToAttack(movingAnimal: movingAnimal, targetAnimal: targetAnimal!, fromCell: fromCell, toCell: toCell) else {
                        return false
                    }
                }
                // Lion and Tiger can jump over water or move one square
                return (isJumpOverWater(move, board) || isMoveOneSquare(move)) && isTargetSelfDen(targetCell: toCell, board: board)
                
            default:
                // Handle attack between animals (check if the moving Animal is not on a trap
                if(targetAnimal != nil){
                    guard isAnimalAbleToAttack(movingAnimal: movingAnimal, targetAnimal: targetAnimal!, fromCell: fromCell, toCell: toCell) else {
                        return false
                    }
                }
                // Animals can move one square other than their den
                return isMoveOneSquare(move) && isTargetSelfDen(targetCell: toCell, board: board)
            }
            
        }
        
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
    
    // Helper method to check if the target cell of a move is its den
    private func isTargetSelfDen(targetCell: Cell, board : Board ) -> Bool {
        return targetCell.cellType == .den && targetCell.initialOwner == currentPlayer
    }
    
    
    func isGameOver(board: Board) -> Bool {
        let selfDen: Cell = currentPlayer == .player1 ? board.grid[0][3] : board.grid[8][3]
        return selfDen.piece != nil
    }
    
}
