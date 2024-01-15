//
//  main.swift
//  DouShouQi_CLI
//
//  Created by etudiant on 12/01/2024.
//

import Foundation
import Model
import ModelEmojiDisplayer


let grid: [[Cell]] = [
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

let board = Board(grid: grid)

print(board ?? "error initializing board")
print ("count piece for player1 (should be 8) : \(board?.countPieces(of: .player1) ?? 0)")
