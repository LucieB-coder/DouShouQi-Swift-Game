//
//  ClassicRules.swift
//
//
//  Created by etudiant on 1/21/24.
//

import Foundation

class ClassicRules : Rules {
    
    func createBoard() -> Board {
        // Grid for board initialization
        let grid: [[Cell]] = 
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
        // Returns the new board
        return Board(grid: grid)!
    }
    
    func getNextPlayer() -> Owner {
        <#code#>
    }
    
    func isMoveValid(board: Board, move: Move) -> Bool {
        <#code#>
    }
    
    func isGameOver(board: Board) -> Bool {
        <#code#>
    }
    
}
