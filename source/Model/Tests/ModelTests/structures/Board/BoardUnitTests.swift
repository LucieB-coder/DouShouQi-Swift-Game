//
//  BoardUnitTests.swift
//
//
//  Created by etudiant on 15/01/2024.
//

import Foundation
import Model
import XCTest

class BoardUnitTests: XCTestCase {
    public var testBoard : Board = Board(
        grid: [
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
    )!
    
    func testCountPiecesPlayer1() {
        let countPlayer1 = testBoard.countPieces(of: .player1)
        XCTAssertEqual(8, countPlayer1)
    }

    func testCountPieces() {
        let (player1, player2) = testBoard.countPieces()
        XCTAssertEqual(8, player1)
        XCTAssertEqual(8, player2)
    }
    
    func testInsertPiece() {
        let piece = Piece(owner: .player1, animal: .cat)
        let result = testBoard.insert(piece: piece, atRow: 0, andColumn: 1)
        
        XCTAssertEqual(result, .ok)
        XCTAssertEqual(testBoard.grid[0][1].piece, piece)
    }

    func testInsertPieceOutOfBounds() {
        let piece = Piece(owner: .player1, animal: .cat)
        let result = testBoard.insert(piece: piece, atRow: 5, andColumn: 10)
        
        XCTAssertEqual(result, .failed(reason: .outOfBounds))
    }

    func testInsertPieceNotEmptyCell() {
        let piece = Piece(owner: .player1, animal: .cat)
        let result = testBoard.insert(piece: piece, atRow: 1, andColumn: 1)
        
        XCTAssertEqual(result, .failed(reason: .cellNotEmpty))
    }

    func testRemovePiece() {
        let result = testBoard.removePiece(atRow: 1, andColumn: 1)
        
        XCTAssertEqual(result, .ok)
        XCTAssertNil(testBoard.grid[1][1].piece)
    }

    func testRemovePieceOutOfBounds() {
        let result = testBoard.removePiece(atRow: 7, andColumn: 9)
        
        XCTAssertEqual(result, .failed(reason: .outOfBounds))
    }

    func testRemovePieceEmptyCell() {
        let result = testBoard.removePiece(atRow: 0, andColumn: 1)
        
        XCTAssertEqual(result, .failed(reason: .cellEmpty))
    }
}
