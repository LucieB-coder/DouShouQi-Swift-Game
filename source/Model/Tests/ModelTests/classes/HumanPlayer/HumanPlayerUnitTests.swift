//
//  HumanPlayerUnitTests.swift
//
//
//  Created by etudiant on 1/30/24.
//

import Foundation
import Model
import XCTest

class HumanPlayerUnitTests: XCTestCase {
    public var grid : [[Cell]] = [[]]
    public var board : Board = Board(grid: [[]])!
    public var rules : VerySimpleRules = VerySimpleRules(occurences: [:], historic: [])
    public var inputMove : () -> Move? = { return nil }
    public var expectedMove : Move? = nil
    
    
    override func setUp() {
        self.grid =
        [
            [Cell(cellType: .jungle),
             Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
             Cell(cellType: .den, initialOwner: .player1),
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
             Cell(cellType: .den, initialOwner: .player2),
             Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion)),
             Cell(cellType: .jungle)],
        ]
        
        self.board = Board(grid: self.grid)!
        
        self.expectedMove = Move(owner: .player1, fromRow: 1, fromColumn: 1, toRow: 2, toColumn: 2)
        self.inputMove = { self.expectedMove! }
    }
    
    func testHumanPlayerInitializerReturnsNil() {
        let humanPlayer: HumanPlayer? = HumanPlayer(withName: "Lucie", andId: .noOne, andInputMethod: inputMove)
        XCTAssertNil(humanPlayer)
    }
    
    func testPlayerInitializer() {
        let humanPlayer: HumanPlayer = HumanPlayer(withName: "Lucie", andId: .player1, andInputMethod: inputMove)!
        XCTAssertNotNil(humanPlayer)
        XCTAssertEqual(humanPlayer.id, .player1)
        XCTAssertEqual(humanPlayer.name, "Lucie")
    }
    
    func testChooseMove() {
        let humanPlayer: HumanPlayer = HumanPlayer(withName: "Lucie", andId: .player1, andInputMethod: self.inputMove)!
        let res = humanPlayer.chooseMove(in: self.board, with: self.rules)!
        XCTAssertEqual(self.expectedMove, res)
    }
}
