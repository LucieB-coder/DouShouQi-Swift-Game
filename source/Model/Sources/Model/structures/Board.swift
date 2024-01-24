//
//  Board.swift
//
//
//  Created by etudiant on 12/01/2024.
//

import Foundation

public struct Board : Hashable {
    public let nbRows : Int
    public let nbColumns : Int
    private(set) public var grid : [[Cell]]
    
    
    public init?(grid: [[Cell]]) {
        let firstRowSize : Int = grid.first?.count ?? 0
        // // allSatisfy enables to apply a condition to each row of the array
        // // returns true if all rows fills the condition
        // // returns false otherwise
        // let areRowsEqualSize = grid.allSatisfy {$0.count == firstRowSize }
        // // guard is a control statement to execute some code if the condition is not met
        // guard areRowsEqualSize else {
        //  // Rows have different sizes
        //     return nil
        // }
        self.nbRows = grid.count
        self.nbColumns = grid.first?.count ?? 0
        self.grid = grid
    }
    
    public func countPieces(of owner: Owner) -> Int {
        // We apply the new map function from ou extension on the drig of the board
        var count: Int = 0
        self.grid.map(andApplyFunction: {Cell in
            if(Cell.piece?.owner == owner){
                count+=1
            }
        })
        return count
    }
    
    public func countPieces() -> (player1: Int, player2: Int) {
        // We call the previous method for both players and return it in a tuple
        return (player1: countPieces(of: .player1), player2: countPieces(of: .player2))
    }
    
    public mutating func insert(piece:Piece, atRow row:Int, andColumn column: Int) -> BoardResult {
        // Guarding that we are inserting the piece on an existing cell (and check that it is not out of bounds)
        guard row+1 <= nbRows && column+1 <= nbColumns else {
            return .failed(reason: .outOfBounds)
        }
        // Guarding that there is not already a piece on the cell we want to insert the piece in
        guard self.grid[row][column].piece == nil else {
            return .failed(reason: .cellNotEmpty)
        }
        // Inserting the piece in the cell
        self.grid[row][column].piece = piece
        return .ok
    }
    
    public mutating func removePiece(atRow row: Int,andColumn column: Int) -> BoardResult {
        // Guarding that we are removing the piece from an existing cell (and check that it is not out of bounds)
        guard row+1 <= nbRows && column+1 <= nbColumns else {
            return .failed(reason: .outOfBounds)
        }
        // Guarding that there is already a piece on the cell we want to remove the piece from
        guard self.grid[row][column].piece != nil else {
            return .failed(reason: .cellEmpty)
        }
        // Removing the piece from the cell
        self.grid[row][column].piece = nil
        return .ok
    }
}

