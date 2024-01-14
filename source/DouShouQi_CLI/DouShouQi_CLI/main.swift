//
//  main.swift
//  DouShouQi_CLI
//
//  Created by etudiant on 12/01/2024.
//

import Foundation
import Model
import ModelEmojiDisplay

print("Hello, World!")

let grid: [[Cell]] = [
    [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .trap, initialOwner: .noOne, piece: nil),
     Cell(cellType: .den, initialOwner: .noOne, piece: nil),
     Cell(cellType: .trap, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger))],
    
    [Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .dog)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .trap, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil)],
    
    [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .leopard)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .wolf)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
    
    [Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),],
    
    [Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),],
    
    [Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),],
    
    [Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .water, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),],
    
    [Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .elephant)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .wolf)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .leopard)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
    
    [Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .trap, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .dog)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil)],
    
    [Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .trap, initialOwner: .noOne, piece: nil),
     Cell(cellType: .den, initialOwner: .noOne, piece: nil),
     Cell(cellType: .trap, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .noOne, piece: nil),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion))],
    
]

let board = Board(grid: grid)

print(board?.displayBoard() ?? "error init board")

/*
🌿🦁🟡  🌿      🪤      🪹      🪤      🌿      🌿🐯🟡

🌿     🌿🐶🟡   🌿      🪤      🌿      🌿🐱🟡   🌿

🌿🐭🟡  🌿      🌿🐆🟡   🌿      🌿🐺🟡   🌿       🌿🐘🟡

🌿      💧      💧      🌿      💧      💧      🌿

🌿      💧      💧      🌿      💧      💧      🌿

🌿      💧      💧      🌿      💧      💧      🌿

🌿      💧      💧      🌿      💧      💧      🌿

🌿🐘🔴   🌿      🌿🐺🔴  🌿      🌿🐆🔴   🌿      🌿🐭🔴

🌿      🌿🐱🔴   🌿      🪤      🌿      🌿🐶🔴  🌿

🌿🐯🔴   🌿      🪤      🪹      🪤      🌿      🌿🦁🔴
*/
