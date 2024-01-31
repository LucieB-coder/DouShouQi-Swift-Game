//
//  MoveUnitTests.swift
//
//
//  Created by etudiant on 1/23/24.
//

import Foundation
import Model
import XCTest

class MoveUnitTests: XCTestCase {
    
    var owner: Owner = .noOne
    var fromRow: Int = 0
    var fromColumn: Int = 0
    var toRow: Int = 0
    var toColumn: Int = 0
    
    
    override func setUp() {
        self.owner = .player1
        self.fromRow =  1
        self.fromColumn = 1
        self.toRow = 2
        self.toColumn = 1
        
        return 
    }
    
    func testMoveInitializerReturnsNil() {
        // change owner to the error value
        self.owner = .noOne
        let move = Move(owner: self.owner, fromRow: self.fromRow, fromColumn: self.fromColumn, toRow: self.toRow, toColumn: self.toColumn)
        XCTAssertNil(move)
    }
    
    func testMoveInitializer() {
        // Initializing a move
        let move = Move(owner: self.owner, fromRow: self.fromRow, fromColumn: self.fromColumn, toRow: self.toRow, toColumn: self.toColumn)!
        // check the different values of a move after initialization
        XCTAssertNotNil(move)
        XCTAssertEqual(move.owner, self.owner)
        XCTAssertEqual(move.fromRow, self.fromRow)
        XCTAssertEqual(move.fromColumn, self.fromColumn)
        XCTAssertEqual(move.toRow, self.toRow)
        XCTAssertEqual(move.toColumn, self.toColumn)
    }
    
    func testMoveDescription() {
        // Initializing a move
        let move = Move(owner: self.owner, fromRow: self.fromRow, fromColumn: self.fromColumn, toRow: self.toRow, toColumn: self.toColumn)!
        XCTAssertEqual(move.description, "1: [1, 1] -> [2, 1]")
    }
    
}
