//
//  RandomPlayerUnitTests.swift
//
//
//  Created by etudiant on 1/30/24.
//

import Foundation
import Model
import XCTest

class RandomPlayerUnitTests: XCTestCase {
    public var grid : [[Cell]] = [[]]
    public var board : Board = Board(grid: [[]])!
    public var rules : VerySimpleRules = VerySimpleRules(occurences: [:], historic: [])
    
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
    }
    
    func testRandomPlayerInitializerReturnsNil() {
        let randomPlayer: RandomPlayer? = RandomPlayer(withId: .noOne, andName: "Lucie")
        XCTAssertNil(randomPlayer)
    }
    
    func testPlayerInitializer() {
        let randomPlayer: RandomPlayer = RandomPlayer(withId: .player1, andName: "Lucie")!
        XCTAssertNotNil(randomPlayer)
        XCTAssertEqual(randomPlayer.id, .player1)
        XCTAssertEqual(randomPlayer.name, "Lucie")
    }
    
    func testChooseMove() {
        let randomPlayer = RandomPlayer(withId: .player1, andName: "Lucie")!
        let res = randomPlayer.chooseMove(in: self.board, with: self.rules)!
        XCTAssert(self.rules.getMoves(board: self.board, owner: randomPlayer.id).contains(res))
    }
}
