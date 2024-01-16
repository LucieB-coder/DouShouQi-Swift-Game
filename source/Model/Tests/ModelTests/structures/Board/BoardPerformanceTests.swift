//
//  BoardPerformanceTests.swift
//  
//
//  Created by etudiant on 15/01/2024.
//

import Foundation
import Model
import XCTest

class BoardPerformanceTests: XCTestCase {
    
    public var grid : [[Cell]] = [[]]
    override func setUp() {
        super.setUp()
        self.grid =
        [
            [Cell](repeating: Cell(cellType: .jungle), count: 100),
            [Cell](repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player1, animal: .cat)), count: 100),
            [Cell](repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player2, animal: .cat)), count: 100),
            [Cell](repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player2, animal: .cat)), count: 75)+[Cell] (repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player1, animal: .cat)), count: 25),

        ]
    }
    
    func testCountPiecesOfPerformance() {
        let board = Board(grid: self.grid)!

        measure() {
            // This block of code will be executed multiple times, and XCTest will measure its performance.
            let count = board.countPieces(of: .player1)
            XCTAssertEqual(125, count) // Adjust the expected count based on your specific scenario
        }
    }
    
    
    func testCountPiecesPerformance() {
        let board = Board(grid: self.grid)!

        measure() {
            // This block of code will be executed multiple times, and XCTest will measure its performance.
            let (player1, player2) = board.countPieces()
            XCTAssertEqual(player1, 125)
            XCTAssertEqual(player2, 175)
        }
    }

    func testInsertPerformance() {
        var board = Board(grid: self.grid)!
        let piece = Piece(owner: .player1, animal: .cat)
        
        measure {
            // This block of code will be executed multiple times, and XCTest will measure its performance.
            for row in 0..<board.nbRows {
                for column in 0..<board.nbColumns {
                    _ = board.insert(piece: piece, atRow: row, andColumn: column)
                }
            }
        }
    }
    
    func testRemovePerformance() {
        var board = Board(grid: self.grid)!

        measure() {
            // This block of code will be executed multiple times, and XCTest will measure its performance.
            for row in 0..<board.nbRows {
                for column in 0..<board.nbColumns {
                    _ = board.removePiece(atRow: row, andColumn: column)
                }
            }
        }
    }
}
