//
//  AnimalUnitTests.swift
//
//
//  Created by etudiant on 1/23/24.
//
import Foundation
import Model
import XCTest

class AnimalUnitTests: XCTestCase {
    var animal : Animal = .rat
    
    func testAnimalValue() {
        XCTAssertEqual(self.animal.force, 1)
        // test all the values of the enum
        self.animal = .cat
        XCTAssertEqual(self.animal.force, 2)
        
        self.animal = .dog
        XCTAssertEqual(self.animal.force, 3)
        
        self.animal = .wolf
        XCTAssertEqual(self.animal.force, 4)
        
        self.animal = .leopard
        XCTAssertEqual(self.animal.force, 5)
        
        self.animal = .tiger
        XCTAssertEqual(self.animal.force, 6)
        
        self.animal = .lion
        XCTAssertEqual(self.animal.force, 7)
        
        self.animal = .elephant
        XCTAssertEqual(self.animal.force, 8)
    }

}

