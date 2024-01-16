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
    
    func testCountPiecesOfPerformance() {
        var grid : [[Cell]] = [[Cell]](repeating: [Cell](repeating: Cell(cellType: .jungle), count: 100), count: 100)
        let player1Row :[Cell] = [Cell](repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player1, animal: .cat)), count: 100)
        grid.append(player1Row)
        let board = Board(grid: grid)!

        measure() {
            // This block of code will be executed multiple times, and XCTest will measure its performance.
            let count = board.countPieces(of: .player1)
            XCTAssertEqual(100, count) // Adjust the expected count based on your specific scenario
        }
    }
    
    
    func testCountPiecesPerformance() {
        var grid : [[Cell]] = [[Cell]](repeating: [Cell](repeating: Cell(cellType: .jungle), count: 100), count: 100)
        let rowPlayer1 :[Cell] = [Cell](repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player1, animal: .cat)), count: 100)
        let rowPlayer2 :[Cell] = [Cell](repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player2, animal: .cat)), count: 100)
        let rowMix: [Cell] = [Cell](repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player2, animal: .cat)), count: 75) + [Cell](repeating: Cell(cellType: .jungle, initialOwner: .noOne, piece: Piece(owner: .player1, animal: .cat)), count: 25)
        grid.append(rowPlayer1)
        grid.append(rowPlayer2)
        grid.append(rowMix)
        let board = Board(grid: grid)!

        measure() {
            // This block of code will be executed multiple times, and XCTest will measure its performance.
            let (player1, player2) = board.countPieces()
            XCTAssertEqual(player1, 125)
            XCTAssertEqual(player2, 175)
        }
    }

    func testInsertPerformance() {
        var board = Board(grid: [[Cell]](repeating: [Cell](repeating: Cell(cellType: .jungle), count: 1000), count: 1000))!
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
        var board = Board(grid: [[Cell]](repeating: [Cell](repeating: Cell(cellType: .jungle), count: 100), count: 100))!

        measure() {
            // This block of code will be executed multiple times, and XCTest will measure its performance.
            for row in 0..<100 {
                for column in 0..<100 {
                    _ = board.removePiece(atRow: row, andColumn: column)
                }
            }
        }
    }
}
