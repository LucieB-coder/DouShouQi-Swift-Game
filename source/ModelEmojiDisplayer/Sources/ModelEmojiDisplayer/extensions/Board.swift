//
//  Board.swift
//  
//
//  Created by etudiant on 15/01/2024.
//

import Foundation
import Model

extension Board : CustomStringConvertible {
    func boardDisplay() -> String {
        var display = ""
        let board : Board = self

        for row in board.grid {
            for cell in row {
                display += "\t"
                display += "\(cell.cellType.symbol)\(cell.piece?.animal.symbol ?? " ")\(cell.piece?.owner.symbol ?? " ")\t"
            }
            display += "\n\n"
        }

        return display
    }
    
    public var description: String { boardDisplay() }
}
