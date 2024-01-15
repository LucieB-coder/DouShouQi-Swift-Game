//
//  Board.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Board {
    public let nbRows : Int
    public let nbColumns : Int
    private(set) public var grid : [[Cell]]
    
    
    public init?(grid: [[Cell]]) {
        let firstRowSize : Int = grid.first?.count ?? 0
        // allSatisfy enables to apply a condition to each row of the array
        // returns true if all rows fills the condition
        // returns false otherwise
        let areRowsEqualSize = grid.allSatisfy {$0.count == firstRowSize }
        // guard is a control statement to execute some code if the condition is not met
        guard areRowsEqualSize else {
            // Rows have different sizes
            return nil
        }
        self.nbRows = grid.count
        self.nbColumns = grid.first?.count ?? 0
        self.grid = grid
    }
    
    public func countPieces(of owner: Owner) -> Int {
        // At the origin, the value is zero
        // For each row of the board, we add the number of pieces belonging to the owner who we want to count his pieces
        // $0 is the previous value
        // $1 is the current row, which we filter to find the pieces of the owner and on which we execute a count action
        return grid.reduce(0) { $0 + $1.filter { $0.piece?.owner == owner }.count }
    }
    
    public func countPieces() -> (player1: Int, player2: Int) {
        // We call the previous method for both players and return it in a tuple
        return (player1: countPieces(of: .player1), player2: countPieces(of: .player2))
    }
    
    public mutating func insert(piece:Piece, atRow row:Int, andColumn column: Int) -> BoardResult {
        guard row+1 <= nbRows && column+1 <= nbColumns else {
            return .failed(reason: .outOfBounds)
        }
        guard self.grid[row][column].piece == nil else {
            return .failed(reason: .cellNotEmpty)
        }
        self.grid[row][column].piece = piece
        return .ok
    }
    
    public mutating func removePiece(atRow row: Int,andColumn column: Int) -> BoardResult {
        guard row+1 <= nbRows && column+1 <= nbColumns else {
            return .failed(reason: .outOfBounds)
        }
        guard self.grid[row][column].piece != nil else {
            return .failed(reason: .cellEmpty)
        }
        self.grid[row][column].piece = nil
        return .ok
    }
}

