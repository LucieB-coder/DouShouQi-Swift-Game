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
    public var grid: [[Cell]] = [[]]
    
    override func setUp() {
        self.grid =
        [
            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .jungle),
             Cell(cellType: .trap),
             Cell(cellType: .den),
             Cell(cellType: .trap),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger))],
      
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .dog)),
             Cell(cellType: .jungle),
             Cell(cellType: .trap, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle)],
        ]
    }
    
    func testBoardInitializerReturnsNil() {
        // New row not containing the same size as the other ones
        self.grid.append([
            Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
            Cell(cellType: .jungle)
        ])
        let board = Board(grid: self.grid)
        XCTAssertNil(board)
    }
    
    func testBoardInitializerOnEmptyGrid(){
        let board = Board(grid: [])!
        XCTAssertEqual(0, board.nbRows)
        XCTAssertEqual(0, board.nbColumns)
    }
    
    func testBoardInitializer() {
        // Initializing a board
        let board: Board = Board(grid: self.grid)!
        XCTAssertNotNil(board)
        XCTAssertEqual(board.grid, self.grid)
        XCTAssertEqual(board.nbRows, grid.count)
        XCTAssertEqual(board.nbColumns, grid.first?.count)
    }
    
    func testCountPiecesPlayer1() {
        let testBoard: Board = Board(grid:self.grid)!
        let countPlayer1 = testBoard.countPieces(of: .player1)
        XCTAssertEqual(2, countPlayer1)
    }
    
    func testCountPiecesPlayer2() {
        let testBoard: Board = Board(grid:self.grid)!
        let countPlayer2 = testBoard.countPieces(of: .player2)
        XCTAssertEqual(3, countPlayer2)
    }

    func testCountPieces() {
        let testBoard: Board = Board(grid:self.grid)!
        let countPieces = testBoard.countPieces()
        XCTAssertEqual(2, countPieces.player1)
        XCTAssertEqual(3, countPieces.player2)
    }
    
    func testInsertPiece() {
        var testBoard: Board = Board(grid:self.grid)!
        let piece = Piece(owner: .player1, animal: .cat)
        let result = testBoard.insert(piece: piece, atRow: 0, andColumn: 1)
        
        XCTAssertEqual(result, .ok)
        XCTAssertEqual(testBoard.grid[0][1].piece, piece)
    }

    func testInsertPieceOutOfBounds() {
        var testBoard: Board = Board(grid:self.grid)!
        let piece = Piece(owner: .player1, animal: .cat)
        let result = testBoard.insert(piece: piece, atRow: 5, andColumn: 5)
        
        XCTAssertEqual(result, .failed(reason: .outOfBounds))
    }

    func testInsertPieceNotEmptyCell() {
        var testBoard: Board = Board(grid:self.grid)!
        let piece = Piece(owner: .player1, animal: .cat)
        let result = testBoard.insert(piece: piece, atRow: 1, andColumn: 1)
        
        XCTAssertEqual(result, .failed(reason: .cellNotEmpty))
    }

    func testRemovePiece() {
        var testBoard: Board = Board(grid:self.grid)!
        let result = testBoard.removePiece(atRow: 1, andColumn: 1)
        
        XCTAssertEqual(result, .ok)
        XCTAssertNil(testBoard.grid[1][1].piece)
    }

    func testRemovePieceOutOfBounds() {
        var testBoard: Board = Board(grid:self.grid)!
        let result = testBoard.removePiece(atRow: 7, andColumn: 7)
        
        XCTAssertEqual(result, .failed(reason: .outOfBounds))
    }

    func testRemovePieceEmptyCell() {
        var testBoard: Board = Board(grid:self.grid)!
        let result = testBoard.removePiece(atRow: 0, andColumn: 1)
        
        XCTAssertEqual(result, .failed(reason: .cellEmpty))
    }
}
