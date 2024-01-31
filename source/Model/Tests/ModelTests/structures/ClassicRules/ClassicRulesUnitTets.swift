//
//  ClassicRulesUnitTets.swift
//
//
//  Created by etudiant on 1/24/24.
//

import Foundation
import Model
import XCTest


/*class ClassicRulesUnitTets: XCTestCase {
    public var occurences: [Board : Int] = [:]
    public var historic: [Move] = []
    public var grid : [[Cell]] = [[]]
    public var board : Board = Board(grid: [[]])!
    public var rules : ClassicRules?
    
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
        
        self.board = Board(grid: self.grid)!
        
        self.rules = ClassicRules()
        
        return
    }
    
    func testCreateBoard() {
        // create the board of very simple rules
        let vsRulesBoard : Board = ClassicRules.createBoard()
        XCTAssertNotNil(vsRulesBoard)
        XCTAssertEqual(vsRulesBoard.grid, self.board.grid)
        XCTAssertEqual(vsRulesBoard.nbRows, self.board.nbRows)
        XCTAssertEqual(vsRulesBoard.nbColumns, self.board.nbColumns)
    }
    
    func testCheckBoardThrowsBadDimensionsGridEmpty() {
        // Change board so that the grid is empty
        self.board = Board(grid: [[]])!
        XCTAssertThrowsError(try ClassicRules.checkBoard(b: self.board)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            if case let InvalidBoardError.badDimensions(nbRows, nbColumns) = error {
                XCTAssertEqual(nbRows, 0)
                XCTAssertEqual(nbColumns, 0)
            } else {
                XCTFail("Expected InvalidBoardError.badDimensions, but got \(error)")
            }
        }
    }
    
    func testCheckBoardThrowsBadDimensionsBadRows() {
        // Change board so that the grid has one row (invalid number of rows)
        self.board = Board(grid: [[Cell(cellType: .jungle),
                                   Cell(cellType: .jungle),
                                   Cell(cellType: .jungle),
                                   Cell(cellType: .jungle),
                                   Cell(cellType: .jungle),]])!
        XCTAssertThrowsError(try ClassicRules.checkBoard(b: self.board)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            if case let InvalidBoardError.badDimensions(nbRows, nbColumns) = error {
                print("Actual number of rows: \(nbRows), Actual number of columns: \(nbColumns)")
                XCTAssertEqual(nbRows, 1)
                XCTAssertEqual(nbColumns, 5)
            }
        }
    }
    
    func testCheckBoardThrowsBadDimensionsBadColumns() {
        // Change board so that the grid has one column (invalid number of column)
        self.board = Board(grid: [[Cell(cellType: .jungle)],
                                  [Cell(cellType: .jungle)],
                                  [Cell(cellType: .jungle)],
                                  [Cell(cellType: .jungle)],
                                  [Cell(cellType: .jungle)]])!
        XCTAssertThrowsError(try ClassicRules.checkBoard(b: self.board)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            if case let InvalidBoardError.badDimensions(nbRows, nbColumns) = error {
                XCTAssertEqual(nbRows, 5)
                XCTAssertEqual(nbColumns, 1)
            } else {
                XCTFail("Expected InvalidBoardError.badDimensions, but got \(error)")
            }
        }
    }
    
    func testCheckBoardThrowsBadDimensionsMismatchedRowSizes() {
        // Change board so that the grid mismatched row sizes
        self.board = Board(grid: [[Cell(cellType: .jungle),
                                   Cell(cellType: .jungle),
                                   Cell(cellType: .jungle),
                                   Cell(cellType: .jungle),
                                   Cell(cellType: .jungle),],
                                  [Cell(cellType: .jungle)],
                                  [Cell(cellType: .jungle)],
                                  [Cell(cellType: .jungle)],
                                  [Cell(cellType: .jungle)]
                                 ])!
        XCTAssertThrowsError(try ClassicRules.checkBoard(b: self.board)) { error in
           XCTAssertTrue(error is InvalidBoardError)
           if case let InvalidBoardError.badDimensions(nbRows, nbColumns) = error {
               XCTAssertEqual(nbRows, 5)
               XCTAssertEqual(nbColumns, 5)
           } else {
               XCTFail("Expected InvalidBoardError.badDimensions, but got \(error)")
           }
       }
    }
    
    func testCheckBoardThrowsBadCellType() {
        // We replace the first cell by a water type
        self.board = Board(grid: [
            [Cell(cellType: .water),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den),
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
             Cell(cellType: .den),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
        ])!
        
        XCTAssertThrowsError(try ClassicRules.checkBoard(b: self.board)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            if case let InvalidBoardError.badCellType(cellType, row, column) = error {
                XCTAssertEqual(cellType, .water)
                XCTAssertEqual(row, 0)
                XCTAssertEqual(column, 0)
            } else {
                XCTFail("Expected InvalidBoardError.badCellType, but got \(error)")
            }
        }
    }
    
    func testCheckBoardThrowsMultipleOccurencesOfSamePiece() {
        // We double the player 1 rat in [0,0]
        self.board = Board(grid: [
            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den),
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
             Cell(cellType: .den),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
        ])!

        XCTAssertThrowsError(try ClassicRules.checkBoard(b: self.board)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            if case let InvalidBoardError.multipleOccurencesOfSamePiece(piece) = error {
                XCTAssertEqual(piece, Piece(owner: .player1, animal: .rat))
            } else {
                XCTFail("Expected InvalidBoardError.multipleOccurencesOfSamePiece, but got \(error)")
            }
        }
    }
    
    func testCheckBoardValid() {
        XCTAssertNoThrow(try ClassicRules.checkBoard(b: self.board))
    }
    
    func testGetNextPlayerPlayer1ToPlayer2() {
        let vsRules : ClassicRules = ClassicRules(historic: [Move(owner: .player1, fromRow: 2, fromColumn: 4, toRow: 3, toColumn: 4)!])
        XCTAssertEqual(vsRules.getNextPlayer(), .player2)
    }

    func testGetNextPlayerPlayer2ToPlayer1() {
        let vsRules : ClassicRules = ClassicRules(historic: [Move(owner: .player2, fromRow: 2, fromColumn: 4, toRow: 3, toColumn: 4)!])
        XCTAssertEqual(vsRules.getNextPlayer(), .player1)
    }
    
    /*func testGetMovesForPlayer1() {
        let moves = self.rules!.getMoves(board: self.board, owner: .player1)
        
        // Expected number of moves for Player 1
        XCTAssertEqual(moves.count, 13)
    }

    func testGetMovesForPlayer2() {
        let moves = self.rules!.getMoves(board: self.board, owner: .player2)
        
        // Expected number of moves for Player 2
           XCTAssertEqual(moves.count, 13)
    }*/
    
    func testIsMoveValidWithCoordinates(){
        // check the error when a piece does not moove
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 0, fromColumn: 0, toRow: 0, toColumn: 0), false)
        
        // check the board boundaries
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 0, fromColumn: 0, toRow: -1, toColumn: 0), false)
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 0, fromColumn: 0, toRow: 0, toColumn: 5), false)
        
        // Check if the moove is not in diagonal
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 0, fromColumn: 0, toRow: 1, toColumn: 1), false)
        
        // Check if the piece at the starting position belongs to the player who makes the move
        self.rules = ClassicRules(historic: [Move(owner: .player2, fromRow: 2, fromColumn: 4, toRow: 3, toColumn: 4)!])
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 0, fromColumn: 0, toRow: 1, toColumn: 1), false)
        self.rules = ClassicRules(historic: [Move(owner: .player1, fromRow: 3, fromColumn: 0, toRow: 3, toColumn: 1)!])
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 0, fromColumn: 0, toRow: 1, toColumn: 1), false)

        self.setUp()
        
        // Check the rules of the rat
        // check the lenght of the move
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
            
            [Cell(cellType: .jungle, piece: Piece(owner: .player1, animal: .rat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
             
        ])!
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 2, fromColumn: 0, toRow: 2, toColumn: 2), false)
        
        // Check a rat cannot eat another animal
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat)),
             Cell(cellType: .jungle, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
             
        ])!
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 1, fromColumn: 0, toRow: 1, toColumn: 1), false)
        
        // Check a rat can eat an elephant
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat)),
             Cell(cellType: .jungle, piece: Piece(owner: .player2, animal: .elephant)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
             
        ])!
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 1, fromColumn: 0, toRow: 1, toColumn: 1), true)
        
        // Check the rules of the elephant
        // check the lenght of the move
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat))],
            
            [Cell(cellType: .jungle, piece: Piece(owner: .player1, animal: .elephant)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
             
        ])!
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 2, fromColumn: 0, toRow: 2, toColumn: 2), false)
        
        // Check an elephant cannot eat rat
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant)),
             Cell(cellType: .jungle, piece: Piece(owner: .player2, animal: .rat)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
             
        ])!
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 1, fromColumn: 0, toRow: 1, toColumn: 1), false)
        
        // Check an elephant can eat other animals
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant)),
             Cell(cellType: .jungle, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
             
        ])!
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 1, fromColumn: 0, toRow: 1, toColumn: 1), true)
        
        // Check the rules of the elephant
        // check the lenght of the move
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat))],
            
            [Cell(cellType: .jungle, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
             
        ])!
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 2, fromColumn: 0, toRow: 2, toColumn: 2), false)
        
        // Check battle with both values
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .jungle, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
             
        ])!
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 1, fromColumn: 0, toRow: 1, toColumn: 1), true)
        XCTAssertEqual(rules?.isMoveValid(board: self.board, fromRow: 1, fromColumn: 2, toRow: 1, toColumn: 3), false)
    }
    
    func testIsGameOver(){
        // test den reached
        var (bool, res) = rules!.isGameOver(board: self.board, row: 0, column: 3)
        XCTAssertEqual(bool, true)
        XCTAssertEqual(res, .winner(owner: historic.last?.owner ?? .noOne , reason: .denReached))
        
        // test if a player has no pieces left
        self.board = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .jungle, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
             Cell(cellType: .jungle, piece: Piece(owner: .player2, animal: .tiger)),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle),],
            
            [Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2)],
            
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2),
             Cell(cellType: .jungle)],
        ])!
        (bool, res) = rules!.isGameOver(board: self.board, row: 0, column: 3)
        XCTAssertEqual(bool, true)
        XCTAssertEqual(res, .winner(owner: historic.last?.owner ?? .noOne , reason: .denReached))
        
    }
    
    func testPlayedMove() {
        let newBoard = Board(grid:
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger)),
             Cell(cellType: .jungle)],

            [Cell(cellType: .jungle, initialOwner: .player1),
             Cell(cellType: .jungle, piece: Piece(owner: .player1, animal: .rat)),
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
        ])!
        self.rules?.playedMove(move: Move(owner: .player1, fromRow: 1, fromColumn: 0, toRow: 1, toColumn: 1)!, boardBeforeMove: self.board, boardAfterMove: newBoard)
        XCTAssertEqual(self.rules?.occurences, [newBoard: 1])
        XCTAssertEqual(self.rules?.historic, [Move(owner: .player1, fromRow: 1, fromColumn: 0, toRow: 1, toColumn: 1)!])
    }
 
}*/
