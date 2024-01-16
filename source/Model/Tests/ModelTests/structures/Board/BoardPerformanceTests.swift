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
}
